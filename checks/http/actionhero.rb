module Intrigue
  module Ident
    module Check
      module Private
        class Actionhero < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "Actionhero",
                :product => "Actionhero",
                :website => "http://www.actionherojs.com/",
                :match_details => "Actionhero - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-powered-by: Actionhero API/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
