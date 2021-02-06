module Intrigue
  module Ident
    module Check
      class OpenScholar < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS", "Drupal Plugin"],
              :vendor => "OpenScholar",
              :product => "OpenScholar",
              :website => "https://theopenscholar.com/",
              :references => ["https://www.drupal.org/project/openscholar"],
              :match_details => "OpenScholar - x-powered-by header",
              :version => nil,
              :match_type => :content_headers,
              :match_content => /x-powered-by: OpenScholar/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => true,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS", "Drupal Plugin"],
              :vendor => "OpenScholar",
              :product => "OpenScholar",
              :website => "https://theopenscholar.com/",
              :references => ["https://www.drupal.org/project/openscholar"],
              :match_details => "OpenScholar - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="OpenScholar/i,
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
