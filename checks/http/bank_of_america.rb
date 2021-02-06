module Intrigue
  module Ident
    module Check
      module Private
        class BankOfAmerica < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Bank Of America",
                :product => "Bank Of America",
                :website => "https://www.bankofamerica.com/",
                :match_details => "Bank Of America Bank Of America - x-boa-requestid Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-boa-requestid:/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.bankofamerica.com/"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Bank Of America",
                :product => "Bank Of America",
                :website => "https://www.bankofamerica.com/",
                :match_details => "Bank Of America Bank Of America - BOFA_LOCALE_COOKIE Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BOFA_LOCALE_COOKIE=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.bankofamerica.com/"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance"],
                :vendor => "Bank Of America",
                :product => "Bank Of America",
                :website => "https://www.bankofamerica.com/",
                :match_details => "Bank Of America Bank Of America - BOA_ Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /BOA_\d+=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.bankofamerica.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
