module Intrigue
  module Ident
    module Check
      module Private
        class Amplitude < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Analytics"],
                :vendor => "Amplitude",
                :product => "Amplitude",
                :website => "https://amplitude.com",
                :match_details => "Amplitude - amplitude-session-id cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /amplitude-session-id=/i,
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
