module Intrigue
  module Ident
    module Check
      module Private
        class TaxJar < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce"],
                :vendor => "TaxJar",
                :product => "TaxJar",
                :website => "https://www.taxjar.com/",
                :match_details => "TaxJar - _taxjar_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_taxjar_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce"],
                :vendor => "TaxJar",
                :product => "TaxJar",
                :website => "https://www.taxjar.com/",
                :match_details => "TaxJar - _taxjar_reporting_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_taxjar_reporting_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
