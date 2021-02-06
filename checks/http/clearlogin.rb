module Intrigue
  module Ident
    module Check
      module Private
        class Clearlogin < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Security", "Management"],
                :vendor => "Clearlogin",
                :product => "Clearlogin",
                :website => "http://www.clearlogin.com/",
                :match_details => "Clearlogin Clearlogin - _cl_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_cl_session=/i,
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
