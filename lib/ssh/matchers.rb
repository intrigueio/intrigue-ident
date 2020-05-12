module Intrigue
module Ident
module Ssh
module Matchers

  require_relative 'ssh'
  include Intrigue::Ident::Ssh
  
  require_relative 'content'
  include Intrigue::Ident::Ssh::Content

  def match_ssh_response_hash(check,response_hash)
    
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