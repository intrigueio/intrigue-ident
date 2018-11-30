module Intrigue
module Ident
module Check
    class Typo3 < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "TYPO3",
            :product => "TYPO3",
            :match_details => "generator tag",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta name="generator" content="TYPO3 CMS"/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
