module Intrigue
module Ident
module Check
    class Jekyll < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "service",
            :tags => ["CMS"], #TODO ... we can also infer Ruby here
            :vendor =>"Jekyll",
            :product =>"Jekyll",
            :match_details =>"server header for Jekyll",
            :references => ["https://jekyllrb.com/"],
            :match_type => :content_generator,
            :match_content =>  /^Jekyll"/i,
            :dynamic_version => lambda { |x|
              _first_generator_capture(x,/Jekyll v(.*)/i)
            },
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
