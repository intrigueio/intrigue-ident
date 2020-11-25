module Intrigue
  module Ident
    module Mysql
      module Content

      #def _banner(content)
      #  content["details"]["banner"]
      #end

      def _error(content)
        "#{content["details"]["error"]}".sanitize_unicode
      end
      
    end
  end
end
end