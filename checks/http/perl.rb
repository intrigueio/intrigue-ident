module Intrigue
module Ident
module Check
    class Perl < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Library"],
            :vendor =>"Perl",
            :product =>"Perl",
            :match_details =>"server header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^.*Perl\/.*$/i,
            :dynamic_version => lambda { |x|
              _first_header_capture(x,/^.*Perl\/v([\d\.]*)\s.*$/i)
            },
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
