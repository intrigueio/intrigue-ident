module Intrigue
module Ident
###
### XXX - significant updates made to zlib, determine whether to
### move this over to RestClient: https://github.com/ruby/ruby/commit/3cf7d1b57e3622430065f6a6ce8cbd5548d3d894
###
def http_request(method, uri_string, credentials=nil, headers={}, data=nil, limit = 10, open_timeout=15, read_timeout=15)

  response = nil
  begin

    # set user agent
    headers["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36"

    attempts=0
    max_attempts=10
    found = false

    uri = URI.parse uri_string

    unless uri
      _log error "Unable to parse URI from: #{uri_string}"
      return
    end

    until( found || attempts >= max_attempts)
     @task_result.logger.log "Getting #{uri}, attempt #{attempts}" if @task_result
     attempts+=1

     if $global_config
       if $global_config.config["http_proxy"]
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
     #http.set_debug_output($stdout) if _get_system_config "debug"
     http.read_timeout = 20
     http.open_timeout = 20

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
       request.body = "intrigue"
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
           #@task_result.logger.log "url was relative" if @task_result
           newuri=uri+response.header['location']
       end
       uri=newuri

     else
       found=true #resp was 404, etc
     end #end if location
   end #until

  ### TODO - this code may be be called outside the context of a task,
  ###  meaning @task_result is not available to it. Below, we check to
  ###  make sure that it exists before attempting to log anything,
  ###  but there may be a cleaner way to do this (hopefully?). Maybe a
  ###  global logger or logging queue?
  ###
  #rescue TypeError
  #  # https://github.com/jaimeiniesta/metainspector/issues/125
  #  @task_result.logger.log_error "TypeError - unknown failure" if @task_result
  rescue ArgumentError => e
    @task_result.logger.log_error "Unable to open connection: #{e}" if @task_result
  rescue Net::OpenTimeout => e
    @task_result.logger.log_error "OpenTimeout Timeout : #{e}" if @task_result
  rescue Net::ReadTimeout => e
    @task_result.logger.log_error "ReadTimeout Timeout : #{e}" if @task_result
  rescue Errno::ETIMEDOUT => e
    @task_result.logger.log_error "ETIMEDOUT Timeout : #{e}" if @task_result
  rescue Errno::EINVAL => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Errno::ENETUNREACH => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Errno::EHOSTUNREACH => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue URI::InvalidURIError => e
    #
    # XXX - This is an issue. We should catch this and ensure it's not
    # due to an underscore / other acceptable character in the URI
    # http://stackoverflow.com/questions/5208851/is-there-a-workaround-to-open-urls-containing-underscores-in-ruby
    #
    @task_result.logger.log_error "Unable to request URI: #{uri} #{e}" if @task_result
  rescue OpenSSL::SSL::SSLError => e
    @task_result.logger.log_error "SSL connect error : #{e}" if @task_result
  rescue Errno::ECONNREFUSED => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Errno::ECONNRESET => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Net::HTTPBadResponse => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Zlib::BufError => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Zlib::DataError => e # "incorrect header check - may be specific to ruby 2.0"
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue EOFError => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue SocketError => e
    @task_result.logger.log_error "Unable to connect: #{e}" if @task_result
  rescue Encoding::InvalidByteSequenceError => e
    @task_result.logger.log_error "Encoding error: #{e}" if @task_result
  rescue Encoding::UndefinedConversionError => e
    @task_result.logger.log_error "Encoding error: #{e}" if @task_result
  end

response
end

end
end