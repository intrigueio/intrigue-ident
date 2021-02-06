module Intrigue
  module Ident
    module Check
      module Private
        class Tenable < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Security", "Cloud"],
                :vendor => "Tenable",
                :product => "Tenable.io",
                :website => "https://www.tenable.com/products/tenable-io",
                :match_details => "Tenable.io server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server:\ tenable.io$/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Security", "Cloud"],
                :vendor => "Tenable",
                :product => "Tenable.io",
                :website => "https://www.tenable.com/products/tenable-io",
                :match_details => "Tenable.io - login page title",
                :version => nil,
                :match_type => :content_title,
                :match_content => /^Tenable.io\ \/\ Login$/,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Security", "Cloud"],
                :vendor => "Tenable",
                :product => "Tenable",
                :website => "https://www.tenable.com",
                :match_details => "Tenable - copyright reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Tenable.+tm.+\,\ Inc/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Security", "Cloud"],
                :vendor => "Tenable",
                :product => "Nessus",
                :website => "https://www.tenable.com/products/nessus/nessus-professional",
                :match_details => "Tenable Nessus - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: NessusWWW/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://167.195.165.212/"],
              },
            ]
          end
        end
      end
    end
  end
end
