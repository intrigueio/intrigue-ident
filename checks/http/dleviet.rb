module Intrigue
  module Ident
    module Check
      module Private
        class Dleviet < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dleviet",
                :product => "DataLife Engine",
                :website => "https://dle-news.ru/",
                :match_details => "DataLife Engine - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="DataLife Engine/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dleviet",
                :product => "DataLife Engine",
                :website => "https://dle-news.ru/",
                :match_details => "DataLife Engine - dle_work cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dle_work=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dleviet",
                :product => "DataLife Engine",
                :website => "https://dle-news.ru/",
                :match_details => "DataLife Engine - dle_user_id cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dle_user_id=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dleviet",
                :product => "DataLife Engine",
                :website => "https://dle-news.ru/",
                :match_details => "DataLife Engine - dle_password cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dle_password=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Dleviet",
                :product => "DataLife Engine",
                :website => "https://dle-news.ru/",
                :match_details => "DataLife Engine - dle_hash cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /dle_hash=/i,
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
