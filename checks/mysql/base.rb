module Intrigue
module Ident
module MysqlCheck
class Base

  include Intrigue::Ident::BannerHelpers

  def self.inherited(base)
    Intrigue::Ident::Mysql::CheckFactory.register(base)
  end

end
end
end
end
