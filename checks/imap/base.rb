module Intrigue
  module Ident
    module ImapCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::Imap::CheckFactory.register(base)
        end
      end
    end
  end
end
