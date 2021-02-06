module Intrigue
  module Ident
    module Check
      module Private
        class Stikked < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Development"],
                :vendor => "Stikked",
                :product => "Stikked",
                :website => "https://github.com/claudehohl/Stikked",
                :match_details => "Stikked - stikked cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /stikked=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://paste.centos.org/"],
              },
            ]
          end
        end
      end
    end
  end
end
