module Intrigue
  module Ident
    module Check
      module Private
        class Solodev < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Solodev",
                :product => "Solodev",
                :website => "http://www.solodev.com/",
                :match_details => "SoloDev - solodev_session header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^solodev_session:/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Solodev",
                :product => "Solodev",
                :website => "https://www.solodev.com/",
                :match_details => "SoloDev - author tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta content="Solodev" name="author"/i,
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
