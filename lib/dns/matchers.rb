module Intrigue
module Ident
module Dns
module Matchers

  require_relative 'dns'
  include Intrigue::Ident::Dns
  
  require_relative 'content'
  include Intrigue::Ident::Dns::Content

  def match_dns_response_hash(check,response_hash)
    
    if check[:type] == "fingerprint"
      if check[:match_type] == :version
        match = _construct_match_response(check,response_hash) if (_version(response_hash) =~ check[:match_content])
      elsif check[:match_type] == :authors
        match = _construct_match_response(check,response_hash) if (_authors(response_hash) =~ check[:match_content])
      elsif check[:match_type] == :hostname
        match = _construct_match_response(check,response_hash) if (_hostname(response_hash) =~ check[:match_content])
      end
    end

  end

end
end
end
end