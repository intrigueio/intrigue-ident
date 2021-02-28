module Intrigue
module Ident
module Redis
module Matchers

  require_relative 'redis'
  include Intrigue::Ident::Redis
  
  require_relative 'content'
  include Intrigue::Ident::Redis::Content

  def match_redis_response_hash(check,response_hash)
    
    if check[:type] == "fingerprint"
      if check[:match_type] == :content_os_version
        match = _construct_match_response(check,response_hash) if _os_version(response_hash) =~ check[:match_content]
      elsif check[:match_type] == :content_redis_version
        match = _construct_match_response(check,response_hash) if _redis_version(response_hash) =~ check[:match_content]
      end
    elsif check[:type] == "content"
      match = _construct_match_response(check,response_hash)
    end

  end

end
end
end
end