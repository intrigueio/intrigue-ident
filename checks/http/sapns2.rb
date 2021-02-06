module Intrigue
  module Ident
    module Check
      module Private
        class Sapns2 < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Security"],
                :vendor => "SAPNS2",
                :product => "SAPNS2",
                :website => "https://sapns2.com/",
                :match_details => "SAPNS2 - SAP_NS2_WARNING_ACCEPT cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /SAP_NS2_WARNING_ACCEPT=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://hcm03.ns2cloud.com/login?company=TREASHCM03"],
              },
            ]
          end
        end
      end
    end
  end
end
