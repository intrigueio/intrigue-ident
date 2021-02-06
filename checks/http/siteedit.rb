module Intrigue
  module Ident
    module Check
      module Private
        class Siteedit < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SiteEdit",
                :product => "SiteEdit",
                :website => "http://www.siteedit.ru/",
                :match_details => "SiteEdit - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="SiteEdit"/i,
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
