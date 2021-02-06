module Intrigue
  module Ident
    module Check
      module Private
        class ButterCMS < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "ButterCMS",
                :product => "Phoenix CMS",
                :website => "https://buttercms.com/phoenix-cms/",
                :match_details => "ButterCMS Phoenix CMS - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Phoenix-CMS/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Phoenix-CMS.*build: (\d+(\.\d+)*).*"/i)
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
