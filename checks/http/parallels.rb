module Intrigue
module Ident
module Check
class Parallels < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative", "Hypervisor"],
        :vendor =>"Parallels",
        :product =>"Parallels Plesk Panel",
        :match_details => "page title",
        :match_type => :content_title,
        :references => ["https://en.wikipedia.org/wiki/Plesk"],
        :match_content => /Plesk.*?/,
        :version => nil,
        :dynamic_version => lambda { |x| 
          _first_title_capture(x,/Plesk (.*?)/) },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative", "Hypervisor"],
        :vendor =>"Parallels",
        :product =>"Parallels Plesk Panel",
        :match_details => "server header",
        :match_type => :content_headers,
        :references => ["https://en.wikipedia.org/wiki/Plesk"],
        :match_content => /server: sw-cp-server/,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
