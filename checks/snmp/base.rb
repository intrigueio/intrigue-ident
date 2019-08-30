module Intrigue
module Ident
module SnmpCheck
class Base

  include Intrigue::Ident::BannerHelpers

  def self.inherited(base)
    Intrigue::Ident::Snmp::CheckFactory.register(base)
  end

end
end
end
end
