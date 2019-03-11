module Intrigue
module Ident
module Check
    class Generic < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "none",
            :vendor => "Generic",
            :product => "Unauthorized",
            :match_details =>"Generic Unauthorized",
            :version => nil,
            :hide => true,
            :match_type => :content_body,
            :match_content =>  /<STRONG>401 Unauthorized/,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "none",
            :vendor => "Generic",
            :product => "Page Missing (404)",
            :match_details =>"Could be an API, or just serving something at another location. TODO ... is this ECS-specific? (check header)",
            :version => nil,
            :hide => true,
            :match_type => :content_body,
            :match_content =>  /<title>404 - Not Found<\/title>/,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
