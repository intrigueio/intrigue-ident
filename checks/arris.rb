module Intrigue
module Ident
module Check
class Arris < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["CDN"],
        :vendor => "Arris",
        :product => "2307 Modem",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<meta name="description" content="ARRIS 2307">/,
        :match_details =>"unique string, admin page?",
        :hide => false,
        :paths => ["#{url}"],
        :examples => ["<meta name=\"description\" content=\"ARRIS 2307\">"]
      }
    ]
  end
end
end
end
end
