module Intrigue
  module Ident
    module Check
      module Private
        class Thinkphp < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "ThinkPHP",
                :product => "ThinkPHP",
                :website => "http://www.thinkphp.cn/",
                :match_details => "ThinkPHP - x-powered-by header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^x-powered-by: Thinkphp/i,
                :hide => false,
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
