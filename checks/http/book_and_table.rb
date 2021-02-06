module Intrigue
  module Ident
    module Check
      module Private
        class BookAndTable < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Education"],
                :vendor => "Book&Table",
                :product => "Book&Table",
                :website => "http://www.bookandtable.com/",
                :match_details => "Book&Table Book&Table - _bookandtable_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_bookandtable_session=/i,
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
