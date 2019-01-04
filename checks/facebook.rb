module Intrigue
module Ident
module Check
    class Facebook < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Marketing", "Javascript"],
            :vendor => "Facebook",
            :product =>"JS SDK",
            :version => nil,
            :match_details =>"load string",
            :match_type => :content_body,
            :match_content =>  /(document, 'script', 'facebook-jssdk')/,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
