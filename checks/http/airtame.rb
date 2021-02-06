module Intrigue
  module Ident
    module Check
      module Private
        class Airtame < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Cloud", "Management"],
                :vendor => "Airtame",
                :product => "Airtame",
                :website => "http://www.airtame.com/",
                :match_details => "Airtame Airtame - _airtame-report_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_airtame-report_session=/i,
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
