module Intrigue
  module Ident
    module Check
      class AstraZeneca < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Organization"],
              :vendor => "AstraZeneca",
              :product => "AstraZeneca",
              :website => "https://www.astrazeneca.co.uk/",
              :match_details => "AstraZeneca AstraZeneca - astrazeneca_session Cookie Match",
              :match_type => :content_cookies,
              :match_content => /astrazeneca_session=/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
            },
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["Organization"],
              :vendor => "AstraZeneca",
              :product => "AstraZeneca",
              :website => "https://www.astrazeneca.co.uk/",
              :match_details => "AstraZeneca AstraZeneca - AZ Cookie Match",
              :match_type => :content_cookies,
              :match_content => /AZ_\d_\d=/i,
              :paths => [{ :path => "#{url}", :follow_redirects => true }],
              :inference => false,
              :test_target => ["https://67.225.147.31:443"],
            },
          ]
        end
      end
    end
  end
end
