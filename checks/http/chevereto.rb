module Intrigue
  module Ident
    module Check
      module Private
        class Chevereto < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hosting"],
                :vendor => "Chevereto",
                :product => "Chevereto",
                :website => "https://chevereto.com/",
                :match_details => "Chevereto - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Chevereto/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Chevereto (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hosting"],
                :vendor => "Chevereto",
                :product => "Chevereto",
                :website => "https://chevereto.com/",
                :match_details => "Chevereto - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Powered by\s*<a href="https:\/\/chevereto.com" rel="generator">Chevereto/i,
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
