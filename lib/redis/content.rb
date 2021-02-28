module Intrigue
  module Ident
    module Redis
      module Content

      def _os_version(content)
        content["details"]["info"]["os"]
      end

      def _redis_version(content)
        content["details"]["info"]["redis_version"]
      end

    end
  end
end
end