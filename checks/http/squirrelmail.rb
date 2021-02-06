module Intrigue
  module Ident
    module Check
      module Private
        class SquirrelMail < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "SquirrelMail",
                :product => "SquirrelMail",
                :website => "https://squirrelmail.org/",
                :match_details => "SquirrelMail - SQMSESSID cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /SQMSESSID=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
                :test_target => ["https://imap.bitybean.com/src/login.php"],
              },
            ]
          end
        end
      end
    end
  end
end
