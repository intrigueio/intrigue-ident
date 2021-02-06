module Intrigue
  module Ident
    module Check
      module Private
        class Blogger < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Blogger",
                :product => "Blogger",
                :website => "http://www.blogger.com/",
                :match_details => "Blogger - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta content="blogger" name="generator"/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Blogger",
                :product => "Blogger",
                :website => "http://www.blogger.com/",
                :match_details => "Blogger - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Powered by\s*<a href=".*www.blogger.com\/">Blogger/i,
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
