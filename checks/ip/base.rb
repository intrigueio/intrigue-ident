module Intrigue
  module Ident
  module IpCheck
  class Base
  
    include Intrigue::Ident::BannerHelpers
  
    def self.inherited(base)
      Intrigue::Ident::Ip::CheckFactory.register(base)
    end
  
  end
  end
  end
  end
  