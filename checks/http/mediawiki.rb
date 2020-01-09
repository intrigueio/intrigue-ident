module Intrigue
module Ident
module Check
class MediaWiki < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "CMS"],
        :vendor =>"MediaWiki",
        :product =>"MediaWiki",
        :match_details =>"powered by tag",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /<a href="\/\/www.mediawiki.org\/">Powered by MediaWiki<\/a>/,
        :paths => ["#{url}"], 
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "CMS"],
        :vendor =>"MediaWiki",
        :product =>"MediaWiki",
        :match_details =>"powered by tag",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /poweredby_mediawiki/,
        :paths => ["#{url}"], 
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "CMS"],
        :vendor =>"MediaWiki",
        :product =>"MediaWiki",
        :match_details =>"generator tag",
        :match_type => :content_body,
        :match_content =>  /<meta name=\"generator\" content=\"MediaWiki/,
        :version => nil,
        :dynamic_version => lambda { |x| _first_body_capture(x,/<meta name=\"generator\" content=\"MediaWiki\ (.*?)\"\/>/) },
        :paths => ["#{url}"], 
        :inference => true
      }
    ]
  end

end
end
end
end
