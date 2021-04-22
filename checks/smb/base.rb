module Intrigue
  module Ident
    module SmbCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::Smb::CheckFactory.register(base)
        end

        def _response_capture(content, regex, filter = [])
          return nil unless content['details']['response']

          x = content['details']['response'].match(regex)
          if x && x.captures
            x = x.captures.first.strip
            filter.each { |f| x.gsub!(f, '') }
            x = x.strip
            return x if x.length > 0
          end
          nil
        end
      end
    end
  end
end
