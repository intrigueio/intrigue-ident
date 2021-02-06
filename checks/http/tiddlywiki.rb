module Intrigue
  module Ident
    module Check
      module Private
        class Tiddlywiki < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "TiddlyWiki",
                :product => "TiddlyWiki",
                :website => "http://tiddlywiki.com/",
                :match_details => "TiddlyWiki - generator page referece",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="TiddlyWiki"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "TiddlyWiki",
                :product => "TiddlyWiki",
                :website => "http://tiddlywiki.com/",
                :match_details => "TiddlyWiki - application-name page referece",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="application-name" content="TiddlyWiki"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "TiddlyWiki",
                :product => "TiddlyWiki",
                :website => "http://tiddlywiki.com/",
                :match_details => "TiddlyWiki - copyright page referece",
                :version => nil,
                :require_product => "TiddlyWiki",
                :match_type => :content_body,
                :match_content => /<meta name="copyright" content="TiddlyWiki created by Jeremy Ruston/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "TiddlyWiki",
                :product => "TiddlyWiki",
                :website => "http://tiddlywiki.com/",
                :match_details => "TiddlyWiki - application-name page referece",
                :version => nil,
                :require_product => "TiddlyWiki",
                :match_type => :content_body,
                :match_content => /<meta name="tiddlywiki-version" content="(\d+(\.\d+)*)"/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="tiddlywiki-version" content="(\d+(\.\d+)*)"/)
                },
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
