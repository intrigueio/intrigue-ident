module Intrigue
  module Ident
    module Check
      module Private
        class Trecker < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS"],
                :vendor => "trecker",
                :product => "trecker",
                :website => "https://www.trecker.com/",
                :match_details => "trecker - _time_trecker_com_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_time_trecker_com_session=/,
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
