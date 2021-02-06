module Intrigue
  module Ident
    module Check
      module Private
        class TikiCorporation < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Tiki Corporation",
                :product => "Tiki Corporation",
                :website => "http://tiki.vn/",
                :match_details => "Tiki Corporation - TKSESSID Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /TKSESSID=/,
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
