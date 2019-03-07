module Intrigue
module Ident
module Check
  class Yoast < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Marketing","Wordpress Plugin"],
          :vendor =>"Yoast",
          :product =>"SEO",
          :match_details => "unique string",
          :match_type => :content_body,
          :references => [],
          :match_content => /This site is optimized with the Yoast SEO plugin/,
          :version => nil,
          :dynamic_version => lambda {|x|
            _first_body_capture(x,/Yoast SEO ([\d\.]+)/)
          },
          :paths => ["#{url}"]
        }
      ]
    end

  end
end
end
end
