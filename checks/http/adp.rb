module Intrigue
  module Ident
    module Check
      module Private
        class ADP < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Finance", "HR"],
                :vendor => "ADP",
                :product => "GlobalView Payroll",
                :website => "https://www.adp.com/what-we-offer/products/adp-globalview-payroll.aspx",
                :match_details => "ADP GlobalView Payroll - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: GlobalView Middle Tier Version/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^Server: GlobalView Middle Tier Version (\d+(\.\d+)*)/i)
                },
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
