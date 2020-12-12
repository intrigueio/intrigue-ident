module Intrigue
module Ident
module Check
class Base

  #include Intrigue::Ident::Content::HttpHelpers

  def self.inherited(base)
    Intrigue::Ident::Http::CheckFactory.register(base)
  end

  def uri_host(url)
    begin 
      URI.parse(url).host
    rescue URI::InvalidURIError => e
      puts "WARNING! attempted to parse invalid URL! #{url}"
    end
  end

  private

    def _uri_match(content, regex)
      return nil unless content["details"]["start_url"] && content["details"]["start_url"].match(regex)
    content["details"]["start_url"].match(regex)
    end

    # matching helpers
    def _all_body_captures(content, regex)
      return nil unless content["details"]["hidden_response_data"] &&
        content["details"]["hidden_response_data"].match(regex)

      match = content["details"]["hidden_response_data"].match(regex)
      return match.captures.map{|x|x.to_s.strip} if match
    
    nil
    end

    def _first_body_match(content, regex)
      return nil unless content["details"]["hidden_response_data"] &&
        content["details"]["hidden_response_data"].match(regex)

    content["details"]["hidden_response_data"].match(regex)
    end

    def _first_body_capture(content, regex, filter=[])
      return nil unless content["details"]["hidden_response_data"]
      x = content["details"]["hidden_response_data"].match(regex)
      if x && x.captures
        x = x.captures.first.strip
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip
        return x if x && x.length > 0
      end
    nil
    end

    def _first_header_match(content, regex)
      return nil unless content["details"]["headers"]
      if content["details"]["headers"].kind_of? Array
        headers = content["details"]["headers"].join("\n")
      else
        headers = content["details"]["headers"].kind_of? Array
      end
    headers.match(regex)
    end

    def _first_header_capture(content, regex, filter=[])
      return nil unless content["details"]["headers"]
      if content["details"]["headers"].kind_of? Array
        headers = content["details"]["headers"].join("\n")
      else
        headers = content["details"]["headers"].kind_of? Array
      end
      x = headers.match(regex)
      if x && x.captures
        x = x.captures.first
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip if x
        return x if x && x.length > 0
      end
    nil
    end

    def _first_cookie_match(content, regex)
      return nil unless content["details"]["cookies"] &&
        content["details"]["cookies"].match(regex)
    content["details"]["cookies"].match(regex)
    end

    def _first_cookie_capture(content, regex, filter=[])
      return nil unless content["details"]["headers"]
      x = content["details"]["cookies"].match(regex)
      if x && x.captures
        x = x.captures.first.strip
        filter.each{|f| x.gsub!(f,"") }
        x = x.strip if x
        return x if x && x.length > 0
      end
    nil
  end

  def _first_title_match(content, regex)
    return nil unless content["details"]["title"] &&
      content["details"]["title"].match(regex)

  content["details"]["title"].match(regex)
  end

  def _first_title_capture(content, regex, filter=[])
    return nil unless content["details"]["title"]
    x = content["details"]["title"].match(regex)
    if x && x.captures
      x = x.captures.first.strip
      filter.each{|f| x.gsub!(f,"") }
      x = x.strip if x
      return x if x && x.length > 0
    end
  nil
  end

  def _first_generator_match(content, regex)
    return nil unless content["details"]["generator"] &&
    content["details"]["generator"].match(regex)

  content["details"]["title"].match(regex)
  end

  def _first_generator_capture(content, regex, filter=[])
    return nil unless content["details"]["generator"]
    x = content["details"]["generator"].match(regex)
    if x && x.captures
      x = x.captures.first.strip
      filter.each{|f| x.gsub!(f,"") }
      x = x.strip if x
      return x if x && x.length > 0
    end
  nil
  end

end
end
end
end
