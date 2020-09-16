module Intrigue
module Ident
module Check
  class Goahead < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        # Server: Goahead/2.5.0 PeerSec-MatrixSSL/3.2.1-OPEN
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["IoT"],
          :vendor => "EmbedThis",
          :product => "GoAhead",
          :match_details => "GoAhead - server header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /^Server: Goahead.*$/i,
          :dynamic_version => lambda{ |x|
              _first_body_capture(x,/^Server: Goahead\/(\d+(\.\d+)*).*$/i)
          },
          :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
          :inference => true
        }
      ]
    end

  end
end
end
end
