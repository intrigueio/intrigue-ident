module Intrigue
module Ident
module Check
    class Jobvite < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          #{
          #  :type => "fingerprint",
          #  :category => "service",
          #  :vendor =>"Jobvite",
          #  :product =>"Jobvite",
          #  :match_details =>"jobvite cookie - unconfirmed!!!!",
          #  :version => nil,
          #  :match_type => :content_cookies,
          #  :match_content =>  /ADRUM_BTa/i,
          #  :paths => ["#{url}"]
          #}
        ]
      end

    end
  end
  end
  end
