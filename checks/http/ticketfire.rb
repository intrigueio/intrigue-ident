module Intrigue
  module Ident
    module Check
      module Private
        class TicketFire < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "TicketFire",
                :product => "TicketFire",
                :website => "http://www.ticketfire.com/",
                :match_details => "TicketFire - _TicketFire-API_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_TicketFire-API_session=/,
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
