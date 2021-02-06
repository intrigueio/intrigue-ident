module Intrigue
  module Ident
    module Check
      module Private
        class ContentBox < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "ContentBox",
                :product => "ContentBox",
                :website => "http://www.gocontentbox.org/",
                :match_details => "ContentBox - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="ContentBox powered by ColdBox"/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "ContentBox",
                :product => "ContentBox",
                :website => "http://www.gocontentbox.org/",
                :match_details => "ContentBox - X-Powered-By header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Powered-By: ContentBox Modular CMS/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "ContentBox",
                :product => "ContentBox",
                :website => "http://www.gocontentbox.org/",
                :match_details => "ContentBox - x-contentbox-cached-content header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /x-contentbox-cached-content:/i,
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
