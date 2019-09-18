#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'zlib'


# load in generic utils
require_relative 'utils'
require_relative 'version'

# Load in http matchers and checks
###################################
require_relative 'http/matchers'
include Intrigue::Ident::Http::Matchers

require_relative 'http/check_factory'
require_relative '../checks/http/base'

# http fingerprints
check_folder = File.expand_path('../checks/http', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# http content checks (always run)
content_check_folder = File.expand_path('../checks/http/content', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# http content, wordpress specific checks
content_check_folder = File.expand_path('../checks/http/wordpress', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# General helpers (apply widely across protocols)

require_relative 'simple_socket'
require_relative 'banner_helpers'

# Load in ftp matchers and checks
#################################
require_relative 'ftp/matchers'
include Intrigue::Ident::Ftp::Matchers

require_relative 'ftp/check_factory'
require_relative '../checks/ftp/base'

# ftp fingerprints
check_folder = File.expand_path('../checks/ftp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# Load in smtp matchers and checks
##################################
require_relative 'smtp/matchers'
include Intrigue::Ident::Smtp::Matchers

require_relative 'smtp/check_factory'
require_relative '../checks/smtp/base'

# smtp fingerprints
check_folder = File.expand_path('../checks/smtp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# Load in snmp matchers and checks
##################################
require_relative 'snmp/matchers'
include Intrigue::Ident::Snmp::Matchers

require_relative 'snmp/check_factory'
require_relative '../checks/snmp/base'

# snmp fingerprints
check_folder = File.expand_path('../checks/snmp', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# Load vulndb client 
require_relative "vulndb_client"

module Intrigue
  module Ident

    def generate_smtp_request_and_check(ip, port=25, debug=false)

      # do the request (store as string and funky format bc of usage in core.. and  json conversions)
      banner_string = grab_banner_smtp(ip,port)
      details = {
        "details" => {
          "banner" => banner_string
        }
      }

      results = []

      # generate the checks 
      checks = Intrigue::Ident::Smtp::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

      # and run them against our result
      checks.each do |check|
        results << match_smtp_response_hash(check,details)
      end

    results.map{|x| (x || {}).merge({"banner" => banner_string})}.uniq.compact
    end


    def generate_ftp_request_and_check(ip, port=21, debug=false)

      # do the request (store as string and funky format bc of usage in core.. and  json conversions)
      banner_string = grab_banner_ftp(ip,port)
      details = {
        "details" => {
          "banner" => banner_string
        }
      }

      results = []

      # generate the checks 
      checks = Intrigue::Ident::Ftp::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

      # and run them against our result
      checks.each do |check|
        results << match_smtp_response_hash(check,details)
      end

    results.map{|x| (x || {}).merge({"banner" => banner_string})}.uniq.compact
    end

    def generate_snmp_request_and_check(ip, port=161, debug=false)
      
            # do the request (store as string and funky format bc of usage in core.. and  json conversions)
      banner_string = grab_banner_smtp(ip,port)
      details = {
        "details" => {
          "banner" => banner_string
        }
      }

      results = []

      # generate the checks 
      checks = Intrigue::Ident::Snmp::CheckFactory.checks.map{ |x| x.new.generate_checks }.compact.flatten

      # and run them against our result
      checks.each do |check|
        results << match_snmp_response_hash(check,details)
      end

    results.map{|x| (x || {}).merge({"banner" => banner_string})}.uniq.compact
    end

    # Used by intrigue-core... note that this will currently fail unless
    def generate_http_requests_and_check(url, dom_checks=true,debug=false)

      # gather all fingeprints for each product
      # this will look like an array of checks, each with a uri and a set of checks
      generated_checks = Intrigue::Ident::Http::CheckFactory.checks.map{ |x|
        x.new.generate_checks(url)}.compact.flatten

      ##### 
      ##### Sanity check!
      #####
      failing_checks = generated_checks.select{|x| x if !x[:paths]}
      if failing_checks.compact.count > 0
        puts "FATAL! Unable to continue, the following checks are invalid, missing a path!"
        puts failing_checks.inspect
        return
      end

      # In order to ensure we check all urls associated with a check, we need to
      # group them up by each path, which is annoying because they're stored in
      # an array on each check. This line handles that. (take all the checks []
      # with each of their paths [], flatten and group by them
      checks_by_path = generated_checks.map{|c| c[:paths].map{ |p|
        c.merge({:unique_path => p})} }.flatten

      # now we have them organized by a single path, group them up so we only
      # have to make a single request per unique path
      grouped_generated_checks = checks_by_path.group_by{|x| x[:unique_path] }

      # shove results into an array
      results = []

      # keep an array of the request / response details
      requests = []

      # keep track of timeouts
      timeout_count = 0

      # call the check on each uri
      grouped_generated_checks.each do |ggc|

        target_url = ggc.first

        if timeout_count > 2
          puts "Skipping #{target_url}, too many timeouts" if debug
          next 
        end

        # get the response using a normal http request
        # TODO - collect redirects here
        puts "Getting #{target_url}" if debug
        response_hash = ident_http_request :get, "#{target_url}"
      
        if response_hash[:timeout]
          puts "ERROR timed out on #{target_url}" if debug
          timeout_count += 1
        end 

        requests << response_hash

        # Only if we are running browser checks
        if dom_checks
          # get the dom via a browser
          if ggc.last.map{|c| c[:match_type] }.include?(:content_dom)
            #puts "We have a check for #{target_url} that requires the DOM, firing a browser"
            session = ident_create_browser_session
            browser_response = ident_capture_document(session,"#{target_url}")

            # save the response to our list of responses
            # TODO - collect redirects here
            # https://michaeltroutt.com/using-headless-chrome-to-find-link-redirects/
            requests << browser_response

            ident_destroy_browser_session session
          end
        end

        # Go ahead and match it up if we got a response!
        if response_hash || browser_response
          # call each check, collecting the product if it's a match
          ggc.last.each do |check|

            # if we have a check that should match the dom, run it
            if (check[:match_type] == :content_dom)
              results << match_browser_response_hash(check,browser_response) if dom_checks
            else #otherwise use the normal flow
              results << match_http_response_hash(check,response_hash)
            end

          end
        end
      end

    return nil unless results

    # Return all matches, minus the nils (non-matches), and grouped by check type
    out = results.compact.group_by{|x| x["type"] }

    # make sure we have an empty fingerprints array if we didnt' have any Matches
    out["fingerprint"] = [] unless out["fingerprint"]
    out["content"] = [] unless out["content"]

    # only return unique results
    out["fingerprint"] = out["fingerprint"].uniq
    out["content"] = out["content"].uniq
    out["url"] = url

    # attach the responses
    out["requests"] = requests

    out
    end

    private

    def _construct_match_response(check, data)

      if check[:type] == "fingerprint"
        calculated_version = (check[:dynamic_version].call(data) if check[:dynamic_version]) || check[:version] || ""
        calculated_update = (check[:dynamic_update].call(data) if check[:dynamic_update]) || check[:update] || ""

        calculated_type = "a" if check[:category] == "application"
        calculated_type = "h" if check[:category] == "hardware"
        calculated_type = "o" if check[:category] == "operating_system"
        calculated_type = "s" if check[:category] == "service" # literally made up

        vendor_string = check[:vendor].gsub(" ","_") if check[:vendor]
        product_string = check[:product].gsub(" ","_") if check[:product]

        version = "#{calculated_version}".gsub(" ","_")
        update = "#{calculated_update}".gsub(" ","_")

        cpe_string = "cpe:2.3:#{calculated_type}:#{vendor_string}:#{product_string}:#{version}:#{update}".downcase

        to_return = {
          "type" => check[:type],
          "vendor" => check[:vendor],
          "product" => check[:product],
          "version" => calculated_version,
          "update" => calculated_update,
          "tags" => check[:tags],
          "match_type" => check[:match_type],
          "match_details" => check[:match_details],
          "hide" => check[:hide],
          "cpe" => cpe_string,
          "inference" => check[:inference]
        }

      elsif check[:type] == "content"

        result = check[:dynamic_result].call(data)
        if result
          hide = check[:dynamic_hide].call(data)
          issue = check[:dynamic_issue].call(data)  
        else 
          hide = false
          issue = false
        end

        to_return = {
          "type" => check[:type],
          "name" => check[:name],
          "hide" => hide,
          "issue" => issue,
          "result" => result
        }
      end

    to_return
    end

end
end

# always include 
include Intrigue::Ident