module Intrigue
module Ident
module Snmp
module Matchers

  require_relative 'snmp'
  include Intrigue::Ident::Snmp
  
  require_relative 'content'
  include Intrigue::Ident::Snmp::Content

  def match_snmp_response_hash(check,response_hash)
    
    puts "Checking... #{check[:vendor]} #{check[:product]}"

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