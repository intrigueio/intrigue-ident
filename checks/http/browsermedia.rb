module Intrigue
module Ident
module Check
class BrowserCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "BrowserMedia",
        :product => "BrowserCMS",
        :references => ["http://www.browsercms.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /BrowserCMS (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /BrowserCMS (.*.\d)/i)},
        :match_details => "header match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
