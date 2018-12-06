module Intrigue
module Ident
module Check
    class PapercutMF < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Administrative","COTS"],
            :references => ["https://www.papercut.com/products/mf/"],
            :vendor => "Papercut",
            :product => "Papercut MF",
            :match_details => "meta description",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta name="description" content="PaperCut MF is a print management system./i,
            :paths => ["#{url}"],
            :examples => ['<meta name="description" content="PaperCut MF']
          }
        ]
      end

    end
  end
  end
  end
