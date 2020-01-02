module Intrigue
module Ident
module Check
class SeamlessCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "SeamlessCMS",
        :product => "SeamlessCMS",
        :references => ["https://www.seamlesscms.com/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Published by Seamless.CMS.WebUI, (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Published by Seamless.CMS.WebUI, (.*.\d)/i)},
        :match_details => "Header match",
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
