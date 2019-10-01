module Intrigue
module Ident
module Check
  class Automattic < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress",
          :match_details =>"wordpress test cookie",
          :version => nil,
          :match_type => :content_cookies,
          :match_content =>  /wordpress_test_cookie=/i,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress",
          :match_details =>"wordpress test cookie",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /class=\"login login-action-login wp-core-ui/i,
          :hide => false,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress",
          :match_details =>"wordpress generator tag",
          :version => nil,
          :match_type => :content_generator,
          :match_content =>  /WordPress/i,
          :dynamic_version => lambda { |x| _first_generator_capture(x, /WordPress\ (.*)/i)},
          :hide => false,
          :paths => ["#{url}"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress",
          :match_details =>"wp-embed link",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /wp-includes\/js\/wp-embed.min.js\?ver=([\d\.]+)\'/i,
          :dynamic_version => lambda { |x| _first_body_capture(x, /wp-includes\/js\/wp-embed.min.js\?ver=([\d\.]+)\'/i)},
          :hide => false,
          :paths => ["#{url}"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress",
          :match_details =>"common link",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /<link rel='https:\/\/api.w.org\/'/,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor =>"Wordpress",
          :product =>"Wordpress (Hosted)",
          :match_details =>"unique header",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-hacker: If you're reading this, you should visit automattic.com/,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress WP-JSON endpoint",
          :version => nil,
          :match_type => :content_body,
          :match_content =>  /gmt_offset/,
          :paths => ["#{url}/wp-json"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.0",
          :match_type => :checksum_body,
          :match_content => "a306a72ce0f250e5f67132dc6bcb2ccb",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.1",
          :match_type => :checksum_body,
          :match_content => "4f04728cb4631a553c4266c14b9846aa",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.2",
          :match_type => :checksum_body,
          :match_content => "25e1e78d5b0c221e98e14c6e8c62084f",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.3",
          :match_type => :checksum_body,
          :match_content => "83c83d0f0a71bd57c320d93e59991c53",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.5",
          :match_type => :checksum_body,
          :match_content => "7293453cf0ff5a9a4cfe8cebd5b5a71a",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.6",
          :match_type => :checksum_body,
          :match_content => "61740709537bd19fb6e03b7e11eb8812",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.7",
          :match_type => :checksum_body,
          :match_content => "e6bbc53a727f3af003af272fd229b0b2",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.7.1",
          :match_type => :checksum_body,
          :match_content => "e6bbc53a727f3af003af272fd229b0b2",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Wordpress",
          :product =>"Wordpress",
          :match_details =>"Wordpress TinyMCE Editor",
          :references => ["https://dcid.me/texts/fingerprinting-web-apps.html"],
          :version => "2.9.1",
          :match_type => :checksum_body,
          :match_content => "128e75ed19d49a94a771586bf83265ec",
          :paths => ["#{url}/wp-includes/js/tinymce/tiny_mce.js"],
          :inference => true
        }
      ]
    end

=begin
all_checks = [{
  :url => "#{url}",
  :checklist => [
  {
    :product =>"Yoast Wordpress SEO Plugin", # won't be used if we have
    :match_details =>"Yoast Wordpress SEO Plugin",
    :match_type => "content",
    :match_content =>  /<!-- \/ Yoast WordPress SEO plugin. -->/,
    :test_site => "https://ip-50-62-231-56.ip.secureserver.net",
    :dynamic_name => lambda{|x| x.scan(/the Yoast WordPress SEO plugin v.* - h/)[0].gsub("the ","").gsub(" - h","") }
  }
]},
=end

  end
end
end
end
