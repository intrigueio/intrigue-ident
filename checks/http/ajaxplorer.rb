module Intrigue
  module Ident
    module Check
      module Private
        class Ajaxplorer < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["COTS"],
                :vendor => "AjaXplorer",
                :product => "AjaXplorer",
                :website => "https://pydio.com/en/community/releases/pydio-core/ajaxplorer-500",
                :match_details => "AjaXplorer - AjaXplorer cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /AjaXplorer=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
                :test_target => ["https://webftp.pluspol-networks.de/"],
              },
            ]
          end
        end
      end
    end
  end
end
