module Intrigue
  module Ident
    module Check
      class Curalate < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "service",
              :tags => ["Marketing", "Social", "CMS", "PaaS"],
              :vendor => "Curalate",
              :product => "Curalate",
              :website => "https://www.curalate.com/",
              :match_details => "Curalate Curalate - Server Header",
              :match_type => :content_headers,
              :match_content => /^server: curalate$/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
          ]
        end
      end
    end
  end
end
