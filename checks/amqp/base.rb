module Intrigue
  module Ident
    module AmqpCheck
      class Base
        include Intrigue::Ident::BannerHelpers

        def self.inherited(base)
          Intrigue::Ident::Amqp::CheckFactory.register(base)
        end
      end
    end
  end
end
