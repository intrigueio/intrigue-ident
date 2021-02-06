module Intrigue
  module Ident
    module Check
      module Private
        class Cbs < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "CBS",
                :product => "CBS",
                :website => "https://www.cbs.com",
                :references => ["https://www.marketingprofs.com/about/cookie-policy"],
                :match_details => "CBS - CBS_INTERNAL cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /CBS_INTERNAL=/i,
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
