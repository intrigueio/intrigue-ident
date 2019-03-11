module Intrigue
module Ident
module Check
    class Blueimp < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Javascript"],
            :vendor => "blueimp",
            :product =>"jQuery-File-Upload",
            :match_details =>"match string in the page",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /jquery.fileupload/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
