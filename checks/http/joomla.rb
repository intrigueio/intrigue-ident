module Intrigue
module Ident
module Check
    class Joomla < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Joomla",
            :product =>"Joomla!",
            :match_details =>"Known Joomla Admin Page",
            :match_type => :content_body,
            :version => nil,
            :match_content =>  /files_joomla/i,
            :references => ["https://twitter.com/GreyNoiseIO/status/987547246538391552"],
            :paths => ["#{url}/administrator/manifests/files/joomla.xml"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Joomla",
            :product =>"Joomla!",
            :match_details =>"generator tag",
            :match_type => :content_generator,
            :version => nil,
            :match_content =>  /^Joomla\! - Open Source Content Management$/i,
            :references => [""],
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
