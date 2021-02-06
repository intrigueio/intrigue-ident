module Intrigue
  module Ident
    module Check
      module Private
        class Textpattern < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Textpattern",
                :product => "Textpattern",
                :website => "https://www.Textpattern.se/",
                :match_details => "Textpattern - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Textpattern( CMS)?"/i,
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
