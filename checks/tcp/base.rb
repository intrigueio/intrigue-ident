module Intrigue
  module Ident
  module TcpCheck
  class Base
  
    include Intrigue::Ident::BannerHelpers
  
    def self.inherited(base)
      Intrigue::Ident::Tcp::CheckFactory.register(base)
    end
  
  end
  end
  end
  end
  