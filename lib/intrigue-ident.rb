#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'zlib'

# load in http libs
require_relative 'http'

require_relative 'content'

# Load in checks
################
require_relative 'check_factory'
require_relative '../checks/base'

# fingerprints
check_folder = File.expand_path('../checks', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

# config checks
check_folder = File.expand_path('../checks/configuration', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }

module Intrigue
  module Ident

    include Intrigue::Ident::Content::Helpers

    # Used by intrigue-core... note that this will currently fail unless
    # Intrigue::Task::Web is available
    def generate_http_requests_and_check(url)

      # load in browser control
      require_relative 'initialize/capybara'
      require_relative 'browser'
      include Intrigue::Ident::Browser

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

        # get the response using a normal http request
        response = http_request :get, "#{target_url}"

        # get the dom from a browser
        if ggc.last.map{|c| c[:match_type] }.include?(:content_dom)
          #puts "We have a check for #{target_url} that requires the DOM, firing a browser"
          session = ident_create_browser_session
          rendered_response = ident_capture_document(session,"#{target_url}")[:rendered]
          ident_destroy_browser_session session
        # else
        # puts "checks: #{ggc.last.map{|c| c[:match_type] }}"
        end

        #unless response
        #  return nil
        #end

        # Go ahead and match it up if we got a response!
        if response
          # call each check, collecting the product if it's a match
          ggc.last.each do |check|

            # if we have a check that should match the dom, run it
            if (check[:match_type] == :content_dom) && rendered_response
              results << match_dom_text(check,rendered_response)
            else #otherwise use the normal flow
              results << match_http_response_object(check,response)
            end

          end
        end

      end

    return nil unless results

    # Return all matches, minus the nils (non-matches), and grouped by check type
    out = results.compact.group_by{|x| x["type"] }

    # make sure we have an empty fingerprints array if we didnt' have any Matches
    out["fingerprint"] = [] unless out["fingerprint"]
    out["configuration"] = [] unless out["configuration"]

    out["fingerprint"] = out["fingerprint"].uniq
    out["configuration"] = out["configuration"].uniq

    out
    end

    def match_dom_text(check,text)
      data = {
        "details" =>  {
          "hidden_response_rendered_data" => text,
          "headers" => [],
          "cookies" => "",
          "generator" => "",
          "title" => ""
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

    # this method takes a check and a net/http response object and
    # constructs it into a format that's matchable. it then attempts
    # to match, and returns a match object if it matches, otherwise
    # returns nil.
    def match_http_response_object(check, response)

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
      match_uri_hash check, data
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
        elsif check[:match_type] == :content_body_rendered
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
      elsif check[:type] == "configuration"
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
        }

      elsif check[:type] == "configuration"

        result = check[:dynamic_result].call(data)

        to_return = {
          "type" => check[:type],
          "name" => check[:name],
          "result" => result
        }
      end

    to_return
    end

end
end