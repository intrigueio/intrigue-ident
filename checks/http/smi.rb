module Intrigue
  module Ident
    module Check
      module Private
        class SMI < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Analytics", "Cloud", "SaaS"],
                :vendor => "Social Media Information",
                :product => "Social Media Information",
                :website => "http://www.smiaware.com/",
                :match_details => "Social Media Information Social Media Information - smi_aware_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /smi_aware_session=/,
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
