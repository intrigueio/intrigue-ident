module Intrigue
module Ident
###
### XXX - significant updates made to zlib, determine whether to
### move this over to RestClient: https://github.com/ruby/ruby/commit/3cf7d1b57e3622430065f6a6ce8cbd5548d3d894
###
def ident_http_request(method, uri_string, credentials=nil, headers={}, data=nil, limit = 10, open_timeout=3, read_timeout=3)

  response = nil
  begin

    # set user agent
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36"
    headers["User-Agent"] = user_agent

    attempts=0
    max_attempts=limit
    found = false
    timeout = false

    uri = URI.parse uri_string

    # keep track of redirects
    response_urls = ["#{uri}"]

    unless uri
      _log error "Unable to parse URI from: #{uri_string}"
      return
    end

    until( found || attempts >= max_attempts)
     @task_result.logger.log "Getting #{uri}, attempt #{attempts}" if @task_result
     attempts+=1

     if $global_config
       if $global_config.config["http_proxy"]
         proxy_config = $global_config.config["http_proxy"]
         proxy_addr = $global_config.config["http_proxy"]["host"]
         proxy_port = $global_config.config["http_proxy"]["port"]
         proxy_user = $global_config.config["http_proxy"]["user"]
         proxy_pass = $global_config.config["http_proxy"]["pass"]
       end
     end

     # set options
     opts = {}
     if uri.instance_of? URI::HTTPS
       opts[:use_ssl] = true
       opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE
     end

     http = Net::HTTP.start(uri.host, uri.port, proxy_addr, proxy_port, opts)

     http.read_timeout = read_timeout
     http.open_timeout = open_timeout

     path = "#{uri.path}"
     path = "/" if path==""

     # add in the query parameters
     if uri.query
       path += "?#{uri.query}"
     end

     ### ALLOW DIFFERENT VERBS HERE
     if method == :get
       request = Net::HTTP::Get.new(uri)
     elsif method == :post
       # see: https://coderwall.com/p/c-mu-a/http-posts-in-ruby
       request = Net::HTTP::Post.new(uri)
       request.body = data
     elsif method == :head
       request = Net::HTTP::Head.new(uri)
     elsif method == :propfind
       request = Net::HTTP::Propfind.new(uri.request_uri)
       request.body = "Here's the body." # Set your body (data)
       request["Depth"] = "1" # Set your headers: one header per line.
     elsif method == :options
       request = Net::HTTP::Options.new(uri.request_uri)
     elsif method == :trace
       request = Net::HTTP::Trace.new(uri.request_uri)
       request.body = "blah blah"
     end
     ### END VERBS

     # set the headers
     headers.each do |k,v|
       request[k] = v
     end

     # handle credentials
     if credentials
       request.basic_auth(credentials[:username],credentials[:password])
     end

     # USE THIS TO PRINT HTTP REQUEST
     #request.each_header{|h| _log_debug "#{h}: #{request[h]}" }
     # END USE THIS TO PRINT HTTP REQUEST

     # get the response
     response = http.request(request)

     if response.code=="200"
       break
     end

     if (response.header['location']!=nil)
       newuri=URI.parse(response.header['location'])
       if(newuri.relative?)
         newuri=URI.parse("#{uri}#{response.header['location']}")
       end
       response_urls << newuri.to_s
       uri=newuri

     else
       found=true #resp was 404, etc
     end #end if location
   end #until

   final_url = uri

  ### TODO - create a global $debug config option
  
  rescue ArgumentError => e
    puts "Unable to connect: #{e}"
  rescue Net::OpenTimeout => e
    puts "Unable to connect: #{e}"
    timeout = true
  rescue Net::ReadTimeout => e
    puts "Unable to connect: #{e}"
    timeout = true
  rescue Errno::ENETDOWN => e
    puts "Unable to connect: #{e}" 
  rescue Errno::ETIMEDOUT => e
    puts "Unable to connect: #{e}" 
    timeout = true
  rescue Errno::EINVAL => e
    puts "Unable to connect: #{e}"
  rescue Errno::ENETUNREACH => e
    puts "Unable to connect: #{e}"
  rescue Errno::EHOSTUNREACH => e
    puts "Unable to connect: #{e}"
  rescue URI::InvalidURIError => e
    #
    # XXX - This is an issue. We should catch this and ensure it's not
    # due to an underscore / other acceptable character in the URI
    # http://stackoverflow.com/questions/5208851/is-there-a-workaround-to-open-urls-containing-underscores-in-ruby
    #
    puts "Unable to connect: #{e}"
  rescue OpenSSL::SSL::SSLError => e
    puts "Unable to connect: #{e}" 
  rescue Errno::ECONNREFUSED => e
    puts "Unable to connect: #{e}" 
  rescue Errno::ECONNRESET => e
    puts "Unable to connect: #{e}" 
  rescue Net::HTTPBadResponse => e
    puts "Unable to connect: #{e}" 
  rescue Zlib::BufError => e
    puts "Unable to connect: #{e}" 
  rescue Zlib::DataError => e # "incorrect header check - may be specific to ruby 2.0"
    puts "Unable to connect: #{e}" 
  rescue EOFError => e
    puts "Unable to connect: #{e}" 
  rescue SocketError => e
    puts "Unable to connect: #{e}" 
  rescue Encoding::InvalidByteSequenceError => e
    puts "Encoding: #{e}" 
  rescue Encoding::UndefinedConversionError => e
    puts "Encoding: #{e}" 
  end

  # generate our output
  out = {
    :timeout => timeout,
    :start_url => uri_string,
    :final_url => final_url,
    :request_type => :ruby,
    :request_method => method,
    :request_credentials => credentials,
    :request_headers => headers,
    :request_data => data,
    :request_attempts_limit => limit,
    :request_attempts_used => attempts,
    :request_user_agent => user_agent,
    :request_proxy => proxy_config,
    :response_urls => response_urls,
    :response_object => response
  }

  # verify we have a response before adding these
  if response
    out[:response_headers] = response.each_header.map{|x| "#{x}: #{response[x]}" }
    out[:response_body] = response.body
  end

  out
end

end
end