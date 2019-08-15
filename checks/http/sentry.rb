module Intrigue
module Ident
module Check
  class Sentry < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "service",
          :tags => ["Javascript", "SaaS", "APM"],
          :vendor =>"Sentry",
          :product =>"Sentry",
          :match_details =>"sentry init js",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /Sentry.init\({dsn:/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end

  end
end
end
end
