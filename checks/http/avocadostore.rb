module Intrigue
  module Ident
    module Check
      module Private
        class Avocadostore < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "avocadostore",
                :product => "avocadostore",
                :website => "http://avocadostore.de/",
                :match_details => "avocadostore avocadostore - _avocado_production_session_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_avocado_production_session_id=/i,
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
