module Intrigue
  module Ident
    module Check
      module Private
        class DmsCookie < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management"],
                :vendor => "dmsCookie",
                :product => "dmsCookie",
                :website => "https://www.dmscookie.com/",
                :match_details => "dmsCookie - dms_referer cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dms_referer=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.getresponse.it/"],
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Management"],
                :vendor => "dmsCookie",
                :product => "dmsCookie",
                :website => "https://www.dmscookie.com/",
                :match_details => "dmsCookie - DMS_COOKIE cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /DMS_COOKIE=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://dms.wy.gov:80"],
              },
            ]
          end
        end
      end
    end
  end
end
