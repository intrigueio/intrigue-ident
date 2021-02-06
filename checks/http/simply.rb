module Intrigue
  module Ident
    module Check
      module Private
        class Simply < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Hosting"],
                :vendor => "Simply",
                :product => "Simply",
                :website => "http://simply.com/",
                :match_details => "Simply Simply - simply_sid Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /simply_sid=/i,
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
