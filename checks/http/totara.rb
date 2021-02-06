module Intrigue
  module Ident
    module Check
      module Private
        class Totara < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Totara",
                :product => "Totara",
                :website => "https://www.totaralearning.com/",
                :match_details => "Totara - TotaraSession cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /TotaraSession=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["LMS"],
                :vendor => "Totara",
                :product => "Totara",
                :website => "https://www.totaralearning.com/",
                :match_details => "Totara - keywords tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="keywords" content="Totara\, Learning Advance Care Planning/i,
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
