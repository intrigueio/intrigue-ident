module Intrigue
  module Ident
  module Check
    class Hadoop < Intrigue::Ident::Check::Base
  
      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "COTS"],
            :vendor =>"Hadoop",
            :product =>"YARN",
            :match_details =>"unique body string",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /user\"\>Logged in as: dr\.who\<\/div\>/im,
            :paths => ["#{url}"],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "COTS"],
            :vendor =>"Hadoop",
            :product =>"YARN",
            :match_details =>"unique body string",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /root.users.dr_dot_who/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end
  
    end
  end
  end
  end
  