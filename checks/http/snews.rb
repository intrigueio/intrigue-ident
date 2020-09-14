module Intrigue
  module Ident
    module Check
      class SNews < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "Snews",
              :product => "Snews",
              :references => ["https://snewscms.com/"],
              :match_details => "sNews - generator page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="sNews/i,
              :dynamic_version => lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="sNews (\d+(\.\d+)*)/i)
              },
              :hide => false,
              :paths => ["#{url}"],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
