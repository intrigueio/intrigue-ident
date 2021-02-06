module Intrigue
  module Ident
    module Check
      module Private
        class Saber < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Saber",
                :product => "Saber",
                :website => "https://saber.land/",
                :match_details => "Saber - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta data-saber-head=".+" name="generator" content="Saber/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta data-saber-head=".+" name="generator" content="Saber v(\d+(\.\d+)*)/i)
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
