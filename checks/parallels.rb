module Intrigue
module Ident
module Check
  class Parallels < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "application",
          :vendor =>"Parallels",
          :product =>"Parallels Plesk Panel",
          :match_details => "page title",
          :match_type => :content_body,
          :references => ["https://en.wikipedia.org/wiki/Plesk"],
          :match_content =>  /<title>Plesk (.*?)<\/title>/,
          :version => nil,
          :dynamic_version => lambda { |x| _first_body_capture(x,/<title>Plesk (.*?)<\/title>/) },
          :paths => ["#{url}"]
        },
        {
          :type => "application",
          :vendor =>"Parallels",
          :product =>"Parallels Plesk Panel",
          :match_details => "server header",
          :match_type => :content_headers,
          :references => ["https://en.wikipedia.org/wiki/Plesk"],
          :match_content => /server: sw-cp-server/,
          :version => nil,
          :paths => ["#{url}"]
        }
      ]
    end

  end
end
end
end
