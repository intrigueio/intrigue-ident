module Intrigue
  module Ident
    module Check
      module Private
        class Tessitura < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CRM"],
                :vendor => "Tessitura",
                :product => "Tessitura",
                :website => "https://www.tessituranetwork.com/",
                :match_details => "Tessitura - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /tnew\.app\.init\(\{\"appVersion\":\".*\",\"databaseVersion\":\".*\",\"tessituraVersion\":\"/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /tnew\.app\.init\(\{\"appVersion\":\".*\",\"databaseVersion\":\".*\",\"tessituraVersion\":\"(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Tessitura",
                :product => "Express Web",
                :website => "https://www.tessituranetwork.com/",
                :match_details => "Tessitura - TNEW cookie",
                :version => nil,
                :match_type => :content_cookies,
                :require_product => "Tessitura",
                :match_content => /TNEW=/i,
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
