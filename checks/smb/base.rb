module Intrigue
  module Ident
    module SmbCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::Smb::CheckFactory.register(base)
        end
      end
    end
  end
end
