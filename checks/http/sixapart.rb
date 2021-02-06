module Intrigue
  module Ident
    module Check
      module Private
        class Sixapart < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Sixapart",
                :product => "Movable Type",
                :website => "http://movabletype.org/",
                :match_details => "Sixapart Movable Type - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Movable Type/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Movable Type (?:[a-z\s]*)(\d+(\.\d+)*)/i)
                },
                :dynamic_update => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Movable Type ([a-z\s]+)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Sixapart",
                :product => "Movable Type",
                :website => "http://movabletype.org/",
                :match_details => "Sixapart Movable Type - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /Powered by\s*<a href="http:\/\/www.sixapart.*"( target=".*")?>(Movable Type|MTOS)/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /Powered by\s*<a href="http:\/\/www.sixapart.*"(?: target=".*")?>(?:Movable Type|MTOS) (\d+(\.\d+)*)/i)
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
