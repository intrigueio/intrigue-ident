module Intrigue
module Ident
module Check
    class Lcn < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "service",
            :vendor =>"LCN",
            :product =>"LCN",
            :match_details =>"body error message",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /This website is temporarily offline - LCN.com/,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
