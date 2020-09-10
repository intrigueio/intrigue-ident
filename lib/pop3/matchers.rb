module Intrigue
module Ident
module Pop3
module Matchers

  require_relative 'pop3'
  include Intrigue::Ident::Pop3
  
  require_relative 'content'
  include Intrigue::Ident::Pop3::Content

  def match_pop3_response_hash(check,response_hash)

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