module Intrigue
module Ident
module SmtpCheck
class Base

  include Intrigue::Ident::BannerHelpers

  def self.inherited(base)
    Intrigue::Ident::Smtp::CheckFactory.register(base)
  end


end
end
end
end
