module Intrigue
  module Ident
    module Check
      module Private
        class AF83 < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "AF83",
                :product => "AF83",
                :website => "http://www.af83.com/",
                :match_details => "AF83 AF83 - _Af83Com_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_Af83Com_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://92.243.26.211/"],
              },
            ]
          end
        end
      end
    end
  end
end
