module Intrigue
module Ident
module Ftp
module Matchers

  require_relative 'ftp'
  include Intrigue::Ident::Ftp
  
  require_relative 'content'
  include Intrigue::Ident::Ftp::Content

  def match_ftp_response_hash(check,response_hash)
    
    if check[:type] == "fingerprint"
      if check[:match_type] == :content_banner
        match = _construct_match_response(check,response_hash) if (_banner(response_hash) =~ check[:match_content])
      end
    end

  end

end
end
end
end