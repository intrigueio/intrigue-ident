module Intrigue
  module Ident
    module Check
      module Private
        class Silverstripe < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SilverStripe",
                :product => "SilverStripe",
                :website => "https://www.silverstripe.org/",
                :match_details => "SilverStripe - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="SilverStripe/i,
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
