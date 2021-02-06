module Intrigue
  module Ident
    module Check
      module Private
        class Tanulobicikli < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Tanulobicikli",
                :product => "Tanulobicikli",
                :website => "https://tanulobicikli.hu/",
                :match_details => "Tanulobicikli Tanulobicikli - _tanulobicikli_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tanulobicikli_session=/i,
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
