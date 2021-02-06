module Intrigue
  module Ident
    module Check
      module Private
        class Cosmoshop < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-commerce"],
                :vendor => "Cosmoshop",
                :product => "Cosmoshop",
                :website => "http://cosmoshop.de/",
                :match_details => "Cosmoshop - javascript functions script tag reference.",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<script( language="JavaScript")? type="text\/javascript" src=".*\/shared\/cosmoshop_functions\.js"><\/script>/i,
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
