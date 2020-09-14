module Intrigue
  module Ident
    module Check
      class AlmubdaCMS < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              :type => "fingerprint",
              :category => "application",
              :tags => ["CMS"],
              :vendor => "Mura",
              :product => "Mura",
              :website => "http://www.getmura.com/",
              :match_details => "Mura CMS - generator tag page reference",
              :version => nil,
              :match_type => :content_body,
              :match_content => /<meta name="generator" content="Mura CMS/i,
              :dynamic_version => lambda { |x|
                _first_body_capture(x, /<meta name="generator" content="Mura CMS (\d+(\.\d+)*)/i)
              },
              :hide => false,
              :paths => ["#{url}"],
              :inference => true,
            },
          ]
        end
      end
    end
  end
end
