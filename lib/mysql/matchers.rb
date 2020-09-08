module Intrigue
module Ident
module Mysql
module Matchers

  require_relative 'mysql'
  include Intrigue::Ident::Mysql
  
  require_relative 'content'
  include Intrigue::Ident::Mysql::Content

  def match_mysql_response_hash(check,response_hash)
    
    if check[:type] == "fingerprint"
      #if check[:match_type] == :content_banner
      #  match = _construct_match_response(check,response_hash) if (
      #    _banner(response_hash) =~ check[:match_content])
      if check[:match_type] == :content_error
        match = _construct_match_response(check,response_hash) if (
          _error(response_hash) =~ check[:match_content])
      end
    end

  end

end
end
end
end