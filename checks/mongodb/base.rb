module Intrigue
  module Ident
    module MongoDbCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::MongoDb::CheckFactory.register(base)
        end
      end
    end
  end
end
