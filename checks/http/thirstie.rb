module Intrigue
  module Ident
    module Check
      module Private
        class Thirstie < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["E-Commerce", "Marketing"],
                :vendor => "Thirstie",
                :product => "Thirstie",
                :website => "https://thirstie.com/",
                :match_details => "Thirstie - thirstie.csrf Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /thirstie-\w*.csrf=/,
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
