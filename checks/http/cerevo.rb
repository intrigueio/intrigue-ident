module Intrigue
  module Ident
    module Check
      module Private
        class Cerevo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["IoT"],
                :vendor => "Cerevo",
                :product => "Cerevo",
                :website => "http://cerevo.com/",
                :match_details => "Cerevo Cerevo - kandamyojin Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /kandamyojin=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://secure.cerevo.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
