module Intrigue
module Ident
module DnsCheck
class Base
  
  def self.inherited(base)
    Intrigue::Ident::Dns::CheckFactory.register(base)
  end

end
end
end
end
