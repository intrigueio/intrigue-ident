module Intrigue
module Ident
module Ftp
module Matchers

  require_relative 'ftp'
  include Intrigue::Ident::Ftp
  
  require_relative 'content'
  include Intrigue::Ident::Ftp::Content

  def match_ftp_response_hash(check,response_hash)
    
    puts "Checking... #{check[:vendor]} #{check[:product]}"

    if check[:type] == "fingerprint"
      if check[:match_type] == :content_banner
        puts "Banner: #{_banner(response_hash)}"
        match = _construct_match_response(check,response_hash) if (_banner(response_hash) =~ check[:match_content])
      end
    end

  end

end
end
end
end