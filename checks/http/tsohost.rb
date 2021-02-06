module Intrigue
  module Ident
    module Check
      module Private
        class Tsohost < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Hosting"],
                :vendor => "tsoHost",
                :product => "tsoHost",
                :website => "https://www.tsohost.com/",
                :match_details => "tsoHost - DYNSRV cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /DYNSRV=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.payguard.co.uk/"],
              },
            ]
          end
        end
      end
    end
  end
end
