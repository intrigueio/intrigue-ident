module Intrigue
  module Ident
    module Check
      module Private
        class Argosoft < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "Argosoft",
                :product => "Mail Server",
                :website => "https://www.argosoft.com/rootpages/MailServer/",
                :match_details => "Argosoft Mail Server - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: ArGoSoft Mail Server Pro/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Argosoft Mail Server Pro.*Version (?:\d+(?:\.\d+)*) \((\d+(\.\d+)*)\)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
