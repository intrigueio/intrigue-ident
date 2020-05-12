module Intrigue
  module Ident
  module SshCheck
  class Base
  
    include Intrigue::Ident::BannerHelpers
  
    def self.inherited(base)
      Intrigue::Ident::Ssh::CheckFactory.register(base)
    end
  
  end
  end
  end
  end
  