module Intrigue
module Ident
module Check
    class VanillaForums < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["COTS"],
            :vendor =>"Vanilla Forums",
            :product =>"Vanilla Forums",
            :match_details =>"nosy header",
            :references => [],
            :match_type => :content_headers,
            :match_content =>  /x-nosy-parker64: TWF5YmUgeW91IHNob3VsZCBiZSByZWFkaW5nIHRoaXMgaW5zdGVhZDogaHR0cHM6Ly93d3cudmFuaWxsYWZvcnVtcy5jb20vZW4vY2FyZWVycw==/i,
            :paths => ["#{url}"],
            :inference => false
          }
        ]
      end

    end
  end
  end
  end
