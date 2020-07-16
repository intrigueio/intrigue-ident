module Intrigue
  module Ident
    module Dns
      module Content

      def _version(content)
        content["details"]["version.bind"]
      end

      def _authors(content)
        content["details"]["authors.bind"]
      end

      def _hostname(content)
        content["details"]["hostname.bind"]
      end

    end
  end
end
end