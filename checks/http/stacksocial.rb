module Intrigue
  module Ident
    module Check
      module Private
        class StackSocial < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Social"],
                :vendor => "StackSocial",
                :product => "StackSocial",
                :website => "https://stacksocial.com/",
                :match_details => "StackSocial StackSocial - v5_stackshops_session_production Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /v5_stackshops_session_production=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://18.213.242.17/"],
              },
            ]
          end
        end
      end
    end
  end
end
