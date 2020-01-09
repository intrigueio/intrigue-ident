module Intrigue
module Ident
module Check
class Cerberus < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :match_details =>"bb_lastactivity cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_lastactivity/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :match_details =>"bb_lastvisit cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_lastvisit/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin", # Jelsoft Enterprises Limited
        :product =>"vBulletin",
        :match_details =>"bb_sessionhash cookie",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /bb_sessionhash/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Social", "Bulletin Board"],
        :vendor => "vBulletin",
        :product =>"vBulletin",
        :match_details =>"'powered by' in page content",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /Powered by vBulletin®/,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
