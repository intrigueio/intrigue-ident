#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'zlib'

# Load in checks
require_relative 'check_factory'
require_relative '../checks/base'
require_relative '../../intrigue-core/lib/tasks/helpers/web'
check_folder = File.expand_path('../checks', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

include Intrigue::Task::Web

module Intrigue
  module Ident

    def ident_generate_requests_and_check(url)

      results = []

      # gather all fingeprints for each product
      # this will look like an array of checks, each with a uri and a SET of checks
      generated_checks = Intrigue::Ident::CheckFactory.checks.map{|x| x.new.generate_checks(url) }.flatten

      # group by the uris, with the associated checks
      # TODO - this only currently supports the first path of the group!!!!
      grouped_generated_checks = generated_checks.group_by{|x| x[:paths].first }

      # call the check on each uri
      grouped_generated_checks.each do |ggc|

        target_url = ggc.first

        # get the response
        response = http_request :get, "#{target_url}"

        unless response
          #puts "Unable to get a response at: #{target_url}, failing"
          return nil
        end

        # Go ahead and match it up if we got a response!
        if response
          # call each check, collecting the product if it's a match
          ggc.last.each do |check|
            results << _match_http_response(check, response)
          end
        end
      end

    # Return all matches, minus the nils (non-matches)
    results.compact
    end

    private

    # this method takes a check and a net/http response object and
    # constructs it into a format that's matchable. it then attempts
    # to match, and returns a match object if it matches, otherwise
    # returns nil.
    def _match_http_response(check, response)

      # Construct an Intrigue Entity of type Uri so we can match it
      data = {}
      data["details"] = {}
      data["details"]["hidden_response_data"] = "#{response.body}"
      # construct the headers into a big string block
      headers = []
      response.each_header do |h,v|
        headers << "#{h}: #{v}"
      end
      data["details"]["headers"] = headers

      ### grab the page attributes
      match = response.body.match(/<title>(.*?)<\/title>/i)
      data["details"]["title"] = match.captures.first if match

      match = response.body.match(/<meta name="generator" content=(.*?)>/i)
      data["details"]["generator"] = match.captures.first.gsub("\"","") if match

      data["details"]["cookies"] = response.header['set-cookie']
      data["details"]["response_data_hash"] = Digest::SHA256.base64digest("#{response.body}")

      # call the actual matcher & return
      _match_uri_hash check, data
    end


    def _match_uri_hash(check, data)
      return nil unless check && data

      # data[:body] => page body
      # data[:headers] => block of text with headers, one per line
      # data[:cookies] => set_cookie header
      # data[:title] => parsed page title
      # data[:generator] => parsed meta generator tag
      # data[:body_md5] => md5 hash of the body
      # if type "content", do the content check

      if check[:match_type] == :content_body
        if data["details"] && data["details"]["hidden_response_data"]
          match = _construct_match_response(check,data) if data["details"]["hidden_response_data"] =~ check[:match_content]
        end
      elsif check[:match_type] == :content_headers
        if data["details"] && data["details"]["headers"]
          match = _construct_match_response(check,data) if data["details"]["headers"].join("\n") =~ check[:match_content]
        end
      elsif check[:match_type] == :content_cookies
        # Check only the set-cookie header
        if data["details"] && data["details"]["cookies"]
          match = _construct_match_response(check,data) if data["details"]["cookies"] =~ check[:match_content]
        end
      elsif check[:match_type] == :content_generator
        # Check only the set-cookie header
        if data["details"] && data["details"]["generator"]
          match = _construct_match_response(check,data) if data["details"]["generator"] =~ check[:match_content]
        end
      elsif check[:match_type] == :content_title
        # Check only the set-cookie header
        if data["details"] && data["details"]["title"]
          match = _construct_match_response(check,data) if data["details"]["title"] =~ check[:match_content]
        end
      elsif check[:match_type] == :checksum_body
        if data["details"] && data["details"]["response_data_hash"]
          match = _construct_match_response(check,data) if Digest::MD5.hexdigest(data["details"]["hidden_response_data"]) == check[:match_content]
        end
      end

    match
    end

    def _construct_match_response(check, data)

      calculated_version = (check[:dynamic_version].call(data) if check[:dynamic_version]) || check[:version] || ""
      calculated_update = (check[:dynamic_update].call(data) if check[:dynamic_update]) || check[:update] || ""

      calculated_type = "a" if check[:type] == "application"
      calculated_type = "h" if check[:type] == "hardware"
      calculated_type = "o" if check[:type] == "operating_system"
      calculated_type = "s" if check[:type] == "service" # literally made up

      vendor_string = check[:vendor].gsub(" ","_")
      product_string = check[:product].gsub(" ","_")

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
        "matched_content" => check[:match_content],
        "match_type" => check[:match_type],
        "match_details" => check[:match_details],
        "hide" => check[:hide],
        "cpe" => cpe_string,
      }

    to_return
    end

=begin
    def ident_check_intrigue_uri_hash(intrigue_uri_data)

      results = []

      # gather all fingeprints for each product
      # this will look like an array of checks, each with a uri and a SET of checks
      generated_checks = Intrigue::Ident::CheckFactory.all.map{|x| x.new.generate_checks("x") }.flatten

      # group by the uris, with the associated checks
      # TODO - this only currently supports the first path of the group!!!!
      grouped_generated_checks = generated_checks.group_by{|x| x[:paths].first }

      # call the check on each uri
      grouped_generated_checks.each do |ggc|

        target_url = ggc.first

        # call each check, collecting the product if it's a match
        ggc.last.each do |check|
          results << _match_uri_hash(check, intrigue_uri_data)
        end
      end

    # Return all matches, minus the nils (non-matches)
    results.compact
    end

    # remove bad checks we need to roll back
    def remove_bad_ident_matches(matches)
      passed_matches = []
      matches.each do |m|
        next if (m["match_type"] == "content_body" &&
                        m["matched_content"] == "(?-mix:Drupal)")

        next if (m["match_type"] == "content_cookies" &&
                        m["matched_content"] == "(?i-mx:ADRUM_BTa)" &&
                        m["product"] == "Jobvite")

        passed_matches << m
      end
    passed_matches
    end

    private


=end




end
end