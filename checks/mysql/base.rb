module Intrigue
module Ident
module MysqlCheck
class Base

  include Intrigue::Ident::ErrorHelpers

  def self.inherited(base)
    Intrigue::Ident::Mysql::CheckFactory.register(base)
  end

end
end
end
end
