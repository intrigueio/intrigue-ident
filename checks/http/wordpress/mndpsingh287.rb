module Intrigue
module Ident
module Check
class Wordfence < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Wordpress Plugin"],
        :vendor =>"Mndpsingh287",
        :product =>"File Manager",
        :match_details =>"plugin details",
        :website => "https://wordpress.org/plugins/wp-file-manager/",
        :references => [
          "https://www.wordfence.com/blog/2020/09/700000-wordpress-users-affected-by-zero-day-vulnerability-in-file-manager-plugin/",
          "https://www.tenable.com/blog/critical-vulnerability-in-file-manager-wordpress-plugin-exploited-in-the-wild"
        ],
        :match_type => :content_body,
        :match_content =>  /mndpsingh287/i,
        :dynamic_version => lambda { |x|
          _first_body_capture(x,/Stable tag: ([\d\.]+)/i)
        },
        :paths => ["#{url}/wp-content/plugins/wp-file-manager/readme.txt"],
        :require_product => "Wordpress",
        :inference => false
      }
    ]
  end

end
end
end
end
