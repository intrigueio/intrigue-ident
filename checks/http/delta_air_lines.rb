module Intrigue
  module Ident
    module Check
      module Private
        class DeltaAirLines < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "Delta Air Lines",
                :product => "Delta Air Lines",
                :website => "https://pro-si.delta.com/",
                :match_details => "Delta - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Delta Air Lines, Inc/i,
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
