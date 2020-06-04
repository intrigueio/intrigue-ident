module Intrigue
module Ident
module Smtp
module Matchers

  require_relative 'smtp'
  include Intrigue::Ident::Smtp
  
  require_relative 'content'
  include Intrigue::Ident::Smtp::Content
  
  # gives us the recog smtp matchers 
  include Intrigue::Ident::Recog::Smtp

  def match_smtp_response_hash(check,response_hash)
  
    if check[:type] == "fingerprint"
      if check[:match_type] == :content_banner
        match = _construct_match_response(check,response_hash) if _banner(response_hash) =~ check[:match_content]
      end
    end

  end

end
end
end
end