module Intrigue
  module Ident
    module Check
      module Private
        class Adtran < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Networking"],
                :vendor => "ADTRAN",
                :product => "ADTRAN",
                :website => "https://www.adtran.com/",
                :match_details => "ADTRAN - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: ADTRAN(, Inc\.)?$/i,
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
