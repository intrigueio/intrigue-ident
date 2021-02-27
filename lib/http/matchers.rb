module Intrigue
module Ident
module Http
module Matchers

  include Intrigue::Ident::Http
  include Intrigue::Ident::Content::Http

  def match_http_response_hash(check,hash)

    # save off the generator string
    generator_match = "#{hash[:response_body]}".match(/<meta name=\"?generator\"? content=\"?(.*?)\"?\/>/i)
    generator_string = generator_match.captures.first.gsub("\"","") if generator_match

    # save off the title string
    title_match = "#{hash[:response_body]}".match(/<title>(.*?)<\/title>/i)
    title_string = title_match.captures.first.strip if title_match

    # grab the set cookie header
    ### note: the cookies in hash[:response_headers] can be an array or just a string, which is why we call .flatten on it
    ### when multiple cookies are given (as an array), we join them first for comprehensive fingerprint checking
    set_cookie_header = (hash[:response_headers]||[]).flatten.select{|x| x =~ /^set-cookie:(.*)/i}.join(";").gsub("set-cookie:","").strip

    data = hash.merge({
      "details" =>  {
        "hidden_response_data" => "#{hash[:response_body]}",
        "hidden_response_data_binary_base64" => "#{hash[:response_body_binary_base64]}",
        "response_code" => "#{hash[:response_code]}",
        "start_url" => "#{hash[:start_url]}",
        "final_url" => "#{hash[:final_url]}",
        "headers" => hash[:response_headers], # this is a hash and we need an array!
        "certificate" => hash[:certificate] || {},
        "cookies" => set_cookie_header,
        "generator" => generator_string,
        "title" => title_string
      }
    })

    #puts "matching #{check} against: #{data}"

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

    # Untested!
    status_string = headers.find{|x| x =~ /^HTTP\/[\d\.]+\s(\d+).*/i; }
    code = status_string.captures.first if x && x.captures

    # TODO - fix to only grab content!!!!
    cookies = headers.select{|x| x =~ /^set-cookie:(.*)/i }

    ### grab the page attributes
    match = body.match(/<title>(.*?)<\/title>/i)
    title = match.captures.first if match

    match = response.body.match(/<meta name=\"?generator\"? content=\"?(.*?)\"?\/?>/i)
    generator = match.captures.first.gsub("\"","") if match

    # rest is a response
    # save title
    # save Cookies
    # save scripts ?
    data = {
      "details" =>  {
        "hidden_response_data" => body,
        "headers" => headers,
        "code" => code.to_i,
        "cookies" => cookies,
        "generator" => generator,
        "title" => title
      }
    }

    match_uri_hash(check,data)
  end

  ###
  ### Tasks a single check and the data, and returns an array of match hashes
  ###
  def match_uri_hash(check, data)
    return nil unless check && data

    # for backward compatibility, we allow checks to be a single check 
    #

    # data[:body] => page body
    # data[:headers] => block of text with headers, one per line
    # data[:cookies] => set_cookie header
    # data[:title] => parsed page title
    # data[:generator] => parsed meta generator tag
    # data[:body_md5] => md5 hash of the body
    # if type "content", do the content check

  
    if check[:type] == "fingerprint"

      # this is here for backward compatability! 
      unless check[:matches] #
        check[:matches] = [
          {
            match_type: check[:match_type],
            match_content: check[:match_content]
          }
        ]
      end
      
      # Now, go through each one and determine if it's a match based on its type
      match_results = []
      check[:matches].each do |m|
        
        ###
        ### Different check types require differnt check methods,
        ### this handles that 
        ###
        if m[:match_type] == :content_body
          value = _body(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_body_raw
          value = _body_raw(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_dom
          value = _body_rendered(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_headers
          value = _headers(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_cookies
          value = _cookies(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_generator
          value = _generator(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_title
          value = _title(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_cert_subject
          value = _cert_subject(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_cert_issuer
          value = _cert_subject(data) =~ m[:match_content] ? true : false
        elsif m[:match_type] == :content_code
          value = _code(data) == m[:match_content] ? true : false
        elsif m[:match_type] == :checksum_body
          value = _body_raw_checksum(data) == m[:match_content] ? true : false
        elsif m[:match_type] == :checksum_body_mmh3
          value = _body_raw_binary_checksum_mmh3(data) == m[:match_content] ? true : false
        end

        # stick it in our array, so we can keep track of each individual match
        match_results << value

      end

    
      #
      # Now, we need to apply our logic about what a match actually is
      # before we can return the right thing
      #
      # valid values: 
      # - :any 
      # - :all
      # 
      out = nil
      if check[:match_logic] == :any && match_results.any? 
        out = _construct_match_response(check,data) 
      elsif check[:match_logic] == :all && match_results.all? 
        out = _construct_match_response(check,data) 
      # legacy, default to simply returning if all (can only be one)
      elsif !check[:match_logic] && match_results.all? 
        out = _construct_match_response(check,data) 
      end
  
    # content stuff will always return a response 
    elsif check[:type] == "content"
      out = _construct_match_response(check,data)
    end 

  out
  end

end
end
end
end