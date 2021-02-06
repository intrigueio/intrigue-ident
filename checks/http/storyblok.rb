module Intrigue
  module Ident
    module Check
      module Private
        class Storyblok < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Storyblok",
                :product => "Storyblok",
                :website => "https://www.storyblok.com/",
                :match_details => "Storyblok - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Storyblok"/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS"],
                :vendor => "Storyblok",
                :product => "Storyblok",
                :website => "https://www.storyblok.com/",
                :match_details => "Storyblok - cms tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="cms" content="https:\/\/www.storyblok.com"/i,
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
