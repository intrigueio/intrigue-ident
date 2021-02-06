module Intrigue
  module Ident
    module Check
      module Private
        class CocaCola < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Coca-Cola",
                :product => "Coca-Cola",
                :website => "https://www.episerver.com/customer-hub/Coca-Cola",
                :match_details => "Coca-Cola - coke_sports_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /coke_sports_session=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://sports.coca-cola.gr:443"],
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Coca-Cola",
                :product => "Coca-Cola",
                :website => "https://www.episerver.com/customer-hub/Coca-Cola",
                :match_details => "Coca-Cola - CocaCola_SessionId cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /CocaCola_SessionId=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://theitalianleague.coca-cola.it:443"],
              },
            ]
          end
        end
      end
    end
  end
end
