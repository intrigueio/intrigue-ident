module Intrigue
    module Ident
    module Check
    module Private
    class Contao < Intrigue::Ident::Check::Base
    
      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Contao",
            :product => "Contao CMS",
            :references => ["https://contao.org/"],
            :match_details =>"Contao CMS - contao_csrf_token cookie.",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /contao_csrf_token/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Contao",
            :product => "Contao CMS",
            :references => ["https://contao.org/"],
            :match_details =>"Contao CMS - powered by page reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /powered by.+(TYPOlight|Contao)/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Contao",
            :product => "Contao CMS",
            :references => ["https://contao.org/"],
            :match_details =>"Contao CMS - generator reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta name=\"generator\" content\=\"Contao Open Source CMS\">/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
          }
        ]
      end
    
    end
    end
    end
    end
    end
