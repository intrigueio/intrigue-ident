module Intrigue
  module Ident
    module Check
      module Private
        class Bluefish < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Editor"],
                :vendor => "Bluefish",
                :product => "Bluefish",
                :website => "http://sourceforge.net/projects/bluefish",
                :match_details => "Bluefish - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Bluefish/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Bluefish (\d+(\.\d+)*)/i)
                },
                :hide => false,
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
