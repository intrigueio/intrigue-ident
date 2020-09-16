module Intrigue
module Ident
module Check
class VBulletin < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :website => "https://www.vbulletin.com/",
        :match_details =>"vBulletin - bblastactivity cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_?lastactivity=/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :website => "https://www.vbulletin.com/",
        :match_details =>"vBulletin - bblastvisit cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_?lastvisit=/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :website => "https://www.vbulletin.com/",
        :match_details =>"vBulletin - bbsessionhash cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_?sessionhash=/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin",
        :product =>"vBulletin",
        :website => "https://www.vbulletin.com/",
        :match_details =>"vBulletin - 'powered by' page referece",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /Powered by vBulletin®?/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
