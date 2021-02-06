module Intrigue
  module Ident
    module Check
      module Private
        class Ticketbud < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Management"],
                :vendor => "Ticketbud",
                :product => "Ticketbud",
                :website => "https://www.ticketbud.com/",
                :match_details => "Ticketbud - _ticketbud_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_ticketbud_session=/,
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
