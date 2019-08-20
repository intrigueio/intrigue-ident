module Intrigue
module Vulndb
class Client

  include Intrigue::Ident

  def self.query(api_key, cpe_string)
  
    begin
      # api uri
      uri = "https://app.intrigue.io/api/vulndb/match_cpe/#{cpe_string}?key=#{api_key}"

      # go query the api
      response = ident_http_request :get, uri
      
      # catch timeout 
      if response[:timeout]
        puts "Error, timed out fetching vulnerabiltiies!" 
        return nil
      end

      # if the API is down, we'll get a nil response, so handle that case gracefully
      unless response[:response_body]
        puts "Error, no response... (do you need a key? email hello@intrigue.io)"
        return nil 
      end

      # parse the body
      result = JSON.parse(response[:response_body])
      
      # return our normal hash
    rescue JSON::ParserError => e
      puts "ERROR, unable to parse vulns response"
    end

  result || []
  end

end
end
end
