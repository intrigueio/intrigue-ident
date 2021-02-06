module Intrigue
  module Ident
    module Check
      module Private
        class SidelineSwap < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "SidelineSwap",
                :product => "SidelineSwap",
                :website => "https://sidelineswap.com/",
                :match_details => "SidelineSwap SidelineSwap - sls_client_id Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /sls_client_id=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "SidelineSwap",
                :product => "SidelineSwap",
                :website => "https://sidelineswap.com/",
                :match_details => "SidelineSwap SidelineSwap - _sls_admin_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_sls_admin_session=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "SidelineSwap",
                :product => "SidelineSwap",
                :website => "https://sidelineswap.com/",
                :match_details => "SidelineSwap SidelineSwap - _sls_admin_session_staging Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_sls_admin_session_staging=/i,
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
