module Intrigue
module Ident
module RedisCheck
class Base

  #include Intrigue::Ident::BannerHelpers

  def self.inherited(base)
    Intrigue::Ident::Redis::CheckFactory.register(base)
  end

  def _info_key_capture(hash, key)
    return nil unless hash["details"]
  hash["details"]["info"][key]
end

end
end
end
end
  