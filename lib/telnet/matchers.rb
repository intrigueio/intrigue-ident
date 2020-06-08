module Intrigue
module Ident
module Telnet
module Matchers

  require_relative 'telnet'
  include Intrigue::Ident::Telnet
  
  require_relative 'content'
  include Intrigue::Ident::Telnet::Content

  def match_telnet_response_hash(check,response_hash)
    
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