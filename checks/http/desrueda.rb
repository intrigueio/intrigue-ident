module Intrigue
  module Ident
    module Check
      module Private
        class Desrueda < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce"],
                :vendor => "Desrueda",
                :product => "Desrueda",
                :website => "https://www.desrueda.com/",
                :match_details => "Desrueda Desrueda - desrueda Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /desrueda=/i,
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
