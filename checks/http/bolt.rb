module Intrigue
  module Ident
    module Check
      module Private
        class Bolt < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Bolt",
                :product => "Bolt",
                :website => "http://bolt.cm/",
                :match_details => "Bolt - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Bolt"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Bolt",
                :product => "Bolt",
                :website => "http://bolt.cm/",
                :match_details => "Bolt - bolt_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /bolt_session_.*=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://thestaffroomuk.com:443"],
              },
            ]
          end
        end
      end
    end
  end
end
