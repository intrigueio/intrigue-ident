#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'zlib'

# load in http libs
require_relative 'utils'
require_relative 'http'
require_relative 'browser'
require_relative 'content'


# Load in checks
################
require_relative 'check_factory'
require_relative '../checks/base'

# fingerprints
check_folder = File.expand_path('../checks', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# config checks
content_check_folder = File.expand_path('../checks/content', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

# wordpress specific checks
content_check_folder = File.expand_path('../checks/wordpress', File.dirname(__FILE__)) # get absolute directory
Dir["#{content_check_folder}/*.rb"].each { |file| require_relative file }

module Intrigue
  module Ident

    include Intrigue::Ident::Content::Helpers
    include Intrigue::Ident::Browser

    # Used by intrigue-core... note that this will currently fail unless
    # Intrigue::Task::Web is available
    def generate_http_requests_and_check(url, dom_checks=true,debug=false)

      # load in browser control
      require_relative 'browser'

      # gather all fingeprints for each product
      # this will look like an array of checks, each with a uri and a set of checks
      generated_checks = Intrigue::Ident::CheckFactory.checks.map{ |x|
        x.new.generate_checks(url) }.flatten

      # in order to ensure we check all urls associated with a check, we need to
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

    def match_http_response_hash(check,hash)

      # save off the generator string
      generator_match = "#{hash[:response_body]}".match(/<meta name="generator" content=(.*?)>/i)
      generator_string = generator_match.captures.first.strip if generator_match

      # save off the title string
      title_match = "#{hash[:response_body]}".match(/<title>(.*?)<\/title>/i)
      title_string = title_match.captures.first.strip if title_match

      # grab the set cookie header
      set_cookie_header = "#{(hash[:response_headers]||[]).select{|x| x =~ /^set-cookie:(.*)/i}.first}".gsub("set-cookie:","").strip

      data = hash.merge({
        "details" =>  {
          "hidden_response_data" => "#{hash[:response_body]}",
          "start_url" => "#{hash[:start_url]}",
          "final_url" => "#{hash[:final_url]}",
          "headers" => hash[:response_headers], # this is a hash and we need an array!
          "cookies" => set_cookie_header,
          "generator" => generator_string,
          "title" => title_string
        }
      })

    match_uri_hash(check,data)
    end

    def match_browser_response_hash(check,browser_response_hash)
      data = {
        "details" =>  {
          "hidden_response_data_rendered" => "#{browser_response_hash[:rendered]}",
          "start_url" => "#{browser_response_hash[:start_url]}",
          "final_url" => "#{browser_response_hash[:final_url]}",
          "headers" => [],
          "cookies" => "",
          "generator" => "",
          "title" => "#{browser_response_hash[:title]}",
        }
      }

      match_uri_hash(check,data)
    end

    # Matches a text http response
    def match_http_response_text(check,http_response_text)

      # first convert to intrigue uri format

      # grab headers
      header_part = http_response_text.split(/\n\n/).first
      body_part = http_response_text.split(/\n\n/).last

      headers = header_part.split("\n");
      body = body_part

      # TODO - fix to only grab content!!!!
      cookies = headers.select{|x| x =~ /^set-cookie:(.*)/i }

      ### grab the page attributes
      match = body.match(/<title>(.*?)<\/title>/i)
      title = match.captures.first if match

      match = body.match(/<meta name="generator" content=(.*?)>/i)
      generator = match.captures.first.gsub("\"","") if match

      # rest is a response
      # save title
      # save Cookies
      # save scripts ?
      data = {
        "details" =>  {
          "hidden_response_data" => body,
          "headers" => headers,
          "cookies" => cookies,
          "generator" => generator,
          "title" => title
        }
      }

      match_uri_hash(check,data)
    end

    def match_uri_hash(check, data)
      return nil unless check && data

      # data[:body] => page body
      # data[:headers] => block of text with headers, one per line
      # data[:cookies] => set_cookie header
      # data[:title] => parsed page title
      # data[:generator] => parsed meta generator tag
      # data[:body_md5] => md5 hash of the body
      # if type "content", do the content check

      if check[:type] == "fingerprint"
        if check[:match_type] == :content_body
          match = _construct_match_response(check,data) if _body(data) =~ check[:match_content]
        elsif check[:match_type] == :content_body_raw
          match = _construct_match_response(check,data) if _body_raw(data) =~ check[:match_content]
        elsif check[:match_type] == :content_dom
          match = _construct_match_response(check,data) if _body_rendered(data) =~ check[:match_content]
        elsif check[:match_type] == :content_headers
          match = _construct_match_response(check,data) if _headers(data) =~ check[:match_content]
        elsif check[:match_type] == :content_cookies
          match = _construct_match_response(check,data) if _cookies(data) =~ check[:match_content]
        elsif check[:match_type] == :content_generator
          match = _construct_match_response(check,data) if _generator(data) =~ check[:match_content]
        elsif check[:match_type] == :content_title
          match = _construct_match_response(check,data) if _title(data) =~ check[:match_content]
        elsif check[:match_type] == :checksum_body
          match = _construct_match_response(check,data) if _body_raw_checksum(data) == check[:match_content]
        end
      elsif check[:type] == "content"
        match = _construct_match_response(check,data)
      end
    match
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
          "matched_content" => check[:match_content],
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