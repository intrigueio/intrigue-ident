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
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Library"],
            :vendor => "Perl",
            :product => "Dancer2",
            :references => ["https://metacpan.org/pod/Dancer2"],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: Perl Dancer2/i,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/server:.*Perl Dancer2.*([\d\.]*).*/i) },
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
         },
         {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Library"],
            :vendor => "Perl",
            :product => "HTTP::Server::PSGI",
            :references => ["https://metacpan.org/pod/HTTP::Server::PSGI"],
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: HTTP::Server::PSGI/i,
            :dynamic_version => lambda { |x| 
              _first_header_capture(x,/server:.*HTTP::Server::PSGI/i) },
            :hide => false,
            :paths => ["#{url}"],
            :inference => false
         },
        ]
      end

    end
  end
  end
  end
