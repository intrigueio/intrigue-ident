module Intrigue
module Ident
module Check
    class Mailchimp < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Marketing","COTS"],
            :vendor => "Mailchimp",
            :product =>"Mandrill",
            :match_details =>"login page",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /<title>Log in to Mandrill/i,
            :paths => ["#{url}"],
          }
        ]
      end

    end
  end
  end
  end
