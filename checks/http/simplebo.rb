module Intrigue
  module Ident
    module Check
      module Private
        class Simplebo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Simplebo",
                :product => "Simplebo",
                :website => "https://www.simplebo.fr/",
                :match_details => "Simplebo - x-servedby header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-servedby: simplebo$/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Simplebo",
                :product => "Simplebo",
                :website => "https://www.simplebo.fr/",
                :match_details => "Simplebo - _simplebo_tool_session cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_simplebo_tool_session=/i,
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
