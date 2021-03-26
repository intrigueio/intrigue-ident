module Intrigue
  module Ident
    module DnsCheck
      class Base
        def self.inherited(base)
          Intrigue::Ident::Dns::CheckFactory.register(base)
        end

        def _first_version_capture(content, regex)
          return nil unless content["details"]["version.bind"] &&
                            content["details"]["version.bind"].match(regex)

          content["details"]["version.bind"].match(regex)
        end

        def _first_version_capture(content, regex, filter = [])
          return nil unless content["details"]["version.bind"]
          x = content["details"]["version.bind"].match(regex)
          if x && x.captures
            x = x.captures.first.strip
            filter.each { |f| x.gsub!(f, "") }
            x = x.strip
            return x if x.length > 0
          end
          nil
        end
      end
    end
  end
end
