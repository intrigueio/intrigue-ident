module Intrigue
  module Ident
    module Check
      module Private
        class SilverstoneCis < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "Marketing"],
                :vendor => "SilverstoneCis",
                :product => "SilverstoneCis",
                :website => "https://www.silverstonecis.com/",
                :match_details => "SilverstoneCis - header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /SilverstoneCIS/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://wendysja.com/"],
              },
            ]
          end
        end
      end
    end
  end
end
