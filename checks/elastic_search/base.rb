module Intrigue
  module Ident
    module ElasticSearchCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::ElasticSearch::CheckFactory.register(base)
        end
      end
    end
  end
end
