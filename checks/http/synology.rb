module Intrigue
  module Ident
    module Check
      module Private
        class Synology < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Storage"],
                :vendor => "Synology",
                :product => "Diskstation Manager",
                :website => "http://synology.com/",
                :match_details => "Synology - application-name page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="application-name" content="Synology DiskStation/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Storage"],
                :vendor => "Synology",
                :product => "Diskstation Manager",
                :website => "http://synology.com/",
                :match_details => "Synology - description page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="description" content="DiskStation provides a full-featured network attached storage/i,
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
