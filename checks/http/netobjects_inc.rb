module Intrigue
  module Ident
    module Check
      class NetObjects < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "NetObjects",
              :product => "Koken",
              :references => ["http://koken.me/"],
              :match_details => "NetObjects Koken - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="Koken (\d+(\.\d+)*)/i,
              :dynamic_version => lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Koken (\d+(\.\d+)*)/i)
              },
              :hide => false,
              :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
