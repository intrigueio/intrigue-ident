module Intrigue
module Ident
module Check
class WordpressRocklobster < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Wordpress Plugin"],
        :vendor =>"Rocklobster",
        :product =>"Contact Form v7",
        :references => ["https://contactform7.com/"],
        :match_details =>"string in wp-json",
        :match_type => :content_body,
        :match_content =>  /contact-form-7/i,
        :version => nil,
        :paths => ["#{url}/wp-json"],
        :inference => false
      }
    ]
  end

end
end
end
end
