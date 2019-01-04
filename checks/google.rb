module Intrigue
module Ident
module Check
    class Google < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["Hosting"],
            :vendor => "Google",
            :product => "Hosted",
            :match_details => "Google Missing Page",
            :match_type => :content_body,
            :version => "",
            :match_content =>  /The requested URL <code>\/<\/code> was not found on this server\./,
            :hide => true,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Embedded", "Appliance","COTS"],
            :vendor => "Google",
            :product =>"Search Appliance",
            :match_details =>"server header reports google search appliance",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: Google Search Appliance/i,
            :paths => ["#{url}"],
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Marketing","Javascript"],
            :vendor => "Google",
            :product =>"Tag Manager",
            :match_details =>"js load string",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<!-- End Google Tag Manager -->/im,
            :paths => ["#{url}"],
          }
        ]
      end

    end
  end
  end
  end
