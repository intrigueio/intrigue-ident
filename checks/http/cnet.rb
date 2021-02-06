module Intrigue
  module Ident
    module Check
      module Private
        class Cnet < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "CNET",
                :product => "CNET",
                :website => "https://www.cnet.com",
                :references => ["https://www.marketingprofs.com/about/cookie-policy"],
                :match_details => "CNET - fly_geo cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /fly_geo=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://news.cbsi.com:80"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "CNET",
                :product => "CNET",
                :website => "https://www.cnet.com",
                :references => ["https://www.marketingprofs.com/about/cookie-policy"],
                :match_details => "CNET - fly_device cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /fly_device=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://news.cbsi.com:80"],
              },
            ]
          end
        end
      end
    end
  end
end
