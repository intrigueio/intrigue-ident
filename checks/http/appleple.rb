module Intrigue
  module Ident
    module Check
      module Private
        class Appleple < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Appleple",
                :product => "a-blog CMS",
                :website => "http://www.a-blogcms.jp/",
                :match_details => "Appleple a-blog CMS - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="a-blog cms"/i,
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
