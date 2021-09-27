module Intrigue
  module Ident
  module UpnpCheck
  class Base

    include Intrigue::Ident::BannerHelpers

    def self.inherited(base)
      Intrigue::Ident::Upnp::CheckFactory.register(base)
    end

  end
  end
  end
  end
