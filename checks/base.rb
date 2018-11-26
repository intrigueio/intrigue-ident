module Intrigue
module Ident
module Check
class Base

  def self.inherited(base)
    CheckFactory.register(base)
  end

  def match_http_response(data)

    # first convert to intrigue uri format

    # grab headers
    header_part = data.split(/\n\n/).first
    body_part = data.split(/\n\n/).last

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
    hash = {
      "details" =>  {
        "hidden_response_data" => body,
        "headers" => headers,
        "cookies" => cookies,
        "generator" => generator,
        "title" => title
      }
    }

    #puts "Converted from HTTP response: #{hash}"

    match_intrigue_uri(hash)

  end

  def match_intrigue_uri(data)

    if match_type == "content_body"

      if data["details"] && data["details"]["hidden_response_data"]
        if data["details"]["hidden_response_data"] =~ Regexp.new(match_content)
          match = _construct_match_response(data)
        end
      end

    elsif match_type == "content_headers"

      if data["details"] && data["details"]["headers"]
        if data["details"]["headers"].join("\n") =~ Regexp.new(match_content)
          match = _construct_match_response(data)
        end
      end

    elsif match_type == "content_cookies"
      # Check only the set-cookie header
      if data["details"] && data["details"]["cookies"]
        if data["details"]["cookies"] =~ Regexp.new(match_content)
          match = _construct_match_response(data)
        end
      end

    elsif match_type == "content_generator"

      # Check only the set-cookie header
      if data["details"] && data["details"]["generator"]
        if data["details"]["generator"] =~ Regexp.new(match_content)
          match = _construct_match_response(data)
        end
      end

    elsif match_type == "content_title"

      # Check only the set-cookie header
      if data["details"] && data["details"]["title"]
        match = _construct_match_response(data) if data["details"]["title"] =~ Regexp.new(match_content)
      end

    elsif match_type == "checksum_body"

      if data["details"] && data["details"]["response_data_hash"]
        match = _construct_match_response(data) if Digest::MD5.hexdigest(data["details"]["hidden_response_data"]) == match_content
      end

    end

  match
  end

  def _match_dynamic(field,regex, data)
    puts "DEBUG: match_dynamic called: #{field} #{regex}"

    #field can be one of ...  headers, body, cookies, title, generator
    if field == "headers"
      return nil unless data["details"]["headers"]
      match_data = data["details"]["headers"].join("\n").match(regex)
      first_match =  match_data.captures.first if match_data
    elsif field == "body"
      return nil unless data["details"]["hidden_response_data"]
      match_data = data["details"]["hidden_response_data"].match(regex)
      first_match =  match_data.captures.first if match_data
    elsif field == "generator"
      return nil unless data["details"]["generator"]
      match_data = data["details"]["generator"].match(regex)
      first_match =  match_data.captures.first if match_data
    elsif field == "cookies"
      return nil unless data["details"]["cookies"]
      match_data = data["details"]["cookies"].match(regex)
      first_match =  match_data.captures.first if match_data
    elsif field == "title"
      return nil unless data["details"]["title"]
      match_data = data["details"]["title"].match(regex)
      first_match =  match_data.captures.first if match_data
    end

  first_match
  end

  def _construct_match_response(data)

    ### HANDLE DYNAMIC STUFF
    if dynamic_version
      calculated_version = _match_dynamic dynamic_version_field,dynamic_version_regex,data
    end

    if dynamic_update
      calculated_update_pkg = _match_dynamic dynamic_update__pkg_field,dynamic_update_pkg_regex,data
    end

    calculated_type = "a" if type == "application"
    calculated_type = "h" if type == "hardware"
    calculated_type = "o" if type == "operating_system"
    calculated_type = "s" if type == "service" # non-standard

    vendor_string = vendor.strip.gsub(" ","_")
    product_string = product.strip.gsub(" ","_")

    version = "#{calculated_version || version}".strip.gsub(" ","_")
    update = "#{calculated_update_pkg || update_pkg}".strip.gsub(" ","_")

    cpe_string = "cpe:2.3:#{calculated_type}:#{vendor_string}:#{product_string}:#{version}:#{update_pkg}".downcase

    #puts "MATCHING VULNS TO #{cpe_string}"

    result = Intrigue::Vulndb::Matcher.new.vulns_from_cpe_string cpe_string

    # return our match hash
    vulns = result.map do |v|
      {
        cve_id: v.name,
        description: v.description
        #cwe_id: v.cwe_id,
        #cvss_v2: {score: v.cvss_v2_score, vector: v.cvss_v2_vector },
        #cvss_v3: {score: v.cvss_v3_score, vector: v.cvss_v3_vector }
      }
    end

    to_return = {
      "type" => type,
      "vendor" => vendor,
      "product" => product,
      "version" => version, # calculated_version,
      "update" => update_pkg, # calculated_update,
      #{}"tags" => tags,
      "vulns" => vulns,
      "matched_content" => match_content,
      "match_type" => match_type,
      "match_details" => match_details,
      "hide" => hide,
      "cpe" => cpe_string
    }

  to_return
  end

  private

    def _body(content)
      content["details"]["hidden_response_data"] || ""
    end

    # matching helpers
    def _first_body_match(content, regex)
      return nil unless content["details"]["hidden_response_data"]
      content["details"]["hidden_response_data"].match(regex)
    end

    def _first_body_capture(content, regex, filter=[])
      return nil unless content["details"]["hidden_response_data"]
      x = content["details"]["hidden_response_data"].match(regex)
      if x
        x = x.captures.first.strip
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip
        return x if x.length > 0
      end
    nil
    end

    def _first_header_match(content, regex)
      return nil unless content["details"]["headers"]
      content["details"]["headers"].match(regex).first
    end

    def _first_header_capture(content,regex, filter=[])
      return nil unless content["details"]["headers"]
      x = content["details"]["headers"].join("\n").match(regex)
      if x
        x = x.captures.first
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip
        return x if x.length > 0
      end
    nil
    end

    def _first_cookie_match(content, regex)
      return nil unless content["details"]["cookies"]
      content["details"]["cookies"].match(regex).first
    end

    def _first_cookie_capture(content, regex, filter=[])
      return nil unless content["details"]["headers"]
      x = content["details"]["cookies"].match(regex)
      if x
        x = x.captures.first.strip
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip
        return x if x.length > 0
      end
    nil
  end

end
end
end
end
