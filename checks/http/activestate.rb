module Intrigue
  module Ident
    module Check
      module Private
        class Activestate < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Text Editor"],
                :vendor => "ActiveState",
                :product => "Komodo Edit",
                :website => "https://www.activestate.com/products/komodo-edit/",
                :match_details => "ActiveSate Komodo Edit - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Komodo Edit/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Komodo Edit(?:, version)? (\d+(\.\d+)*)/i)
                },
                :dynamic_update => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Komodo Edit(?:, version)? (?:\d+(?:\.\d+)*-)(\w+)/i)
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
