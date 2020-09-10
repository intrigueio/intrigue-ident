module Intrigue
  module Ident
  module Pop3Check
  class Base
  
    include Intrigue::Ident::BannerHelpers
  
    def self.inherited(base)
      Intrigue::Ident::Pop3::CheckFactory.register(base)
    end
  
  end
  end
  end
  end
  