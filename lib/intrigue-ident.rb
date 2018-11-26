#!/usr/bin/env ruby
require 'net/http'
require 'openssl'
require 'zlib'

# Load in checks
require_relative 'check_factory'
require_relative '../checks/base'
check_folder = File.expand_path('../checks', File.dirname(__FILE__)) # get absolute directory
Dir["#{check_folder}/*.rb"].each { |file| require_relative file }


module Intrigue
  module Ident

    # Used by intrigue-core... note that this will currently fail unless
    # Intrigue::Task::Web is available
    def generate_http_requests_and_check(url)

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
          return nil
        end

        # Go ahead and match it up if we got a response!
        if response
          # call each check, collecting the product if it's a match
          ggc.last.each do |check|
            results << match_http_response_object(check,response)
          end
        end
      end

    # Return all matches, minus the nils (non-matches)
    results.compact
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
      #puts check
      #puts data

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
        #puts "trying to match headers: #{check} #{data["details"]["headers"]}"
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

    private

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




end
end