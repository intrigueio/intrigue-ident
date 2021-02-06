module Intrigue
  module Ident
    module Check
      module Private
        class Superfeedr < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["API"],
                :vendor => "Superfeedr",
                :product => "Superfeedr",
                :website => "https://superfeedr.com/",
                :match_details => "Superfeedr - _superfeedr_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_superfeedr_session/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.superfeedr.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
