module Intrigue
  module Ident
    module Ssh
      class CheckFactory
        def self.inherited(base)
          Intrigue::Ident::Base::CheckFactory.register(base)
        end
      end
    end
  end
end
