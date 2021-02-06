module Intrigue
  module Ident
    module Check
      module Private
        class Thumbtack < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Thumbtack",
                :product => "Thumbtack",
                :website => "https://www.thumbtack.com/",
                :match_details => "Thumbtack Thumbtack - tt_canary Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tt_canary=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Thumbtack",
                :product => "Thumbtack",
                :website => "https://www.thumbtack.com/",
                :match_details => "Thumbtack Thumbtack - tt_utm_entries Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /tt_utm_entries=/i,
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
