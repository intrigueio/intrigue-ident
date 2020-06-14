module Intrigue
  module Ident
  module TelnetCheck
  class Base
  
    include Intrigue::Ident::BannerHelpers
  
    def self.inherited(base)
      Intrigue::Ident::Telnet::CheckFactory.register(base)
    end
  
  end
  end
  end
  end
  