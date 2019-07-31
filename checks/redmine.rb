module Intrigue
module Ident
module Check
    class Redmine < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          #
          { # server: Apache/2.4.6 (Red Hat Enterprise Linux) OpenSSL/1.0.2k-fips PHP/7.2.12
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Redmine",
            :product =>"Redmine",
            :match_details =>"redmine",
            :match_type => :content_cookies,
            :match_content =>  /_redmine_session=/i,
            :paths => ["#{url}"],
            :inference => false
          },
          { # server: Apache/2.4.6 (Red Hat Enterprise Linux) OpenSSL/1.0.2k-fips PHP/7.2.12
            :type => "fingerprint",
            :category => "operating_system",
            :tags => ["OS"],
            :vendor =>"Redmine",
            :product =>"Redmine",
            :match_details =>"redmine",
            :match_type => :content_title,
            :match_content =>  /^Redmine$/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
