module Intrigue
  module Ident
    module Check
      module Private
        class Snorby < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Security", "Monitoring"],
                :vendor => "Snorby Project",
                :product => "Snorby",
                :website => "https://github.com/Snorby/snorby",
                :match_details => "Snorby Project - _snorby_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_snorby_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Security", "Monitoring"],
                :vendor => "Snorby Project",
                :product => "Snorby",
                :website => "https://github.com/Snorby/snorby",
                :match_details => "Snorby Project - comment page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<!-- Snorby - Version: (\d+(\.\d+)*) - https:\/\/github.com\/Snorby\/snorby -->/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<!-- Snorby - Version: (\d+(\.\d+)*) - https:\/\/github.com\/Snorby\/snorby -->/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Security", "Monitoring"],
                :vendor => "Snorby Project",
                :product => "Snorby",
                :website => "https://github.com/Snorby/snorby",
                :match_details => "Snorby Project - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Snorby (\d+(\.\d+)*) -\s*<a href="https:\/\/github.com\/Snorby\/snorby">https:\/\/github.com\/Snorby\/snorby<\/a> /i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /Snorby (\d+(\.\d+)*) -\s*<a href="https:\/\/github.com\/Snorby\/snorby">https:\/\/github.com\/Snorby\/snorby<\/a> /i)
                },
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
