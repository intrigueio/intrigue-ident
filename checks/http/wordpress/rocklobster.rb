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
        :product =>"Contact Form 7",
        :references => ["https://contactform7.com/"],
        :match_details =>"string in wp-json",
        :match_type => :content_body,
        :match_content =>  /contact-form-7/i,
        :version => nil,
        :paths => [{ :path => "#{url}/wp-json", :follow_redirects => true } ],
        :require_product => "Wordpress",
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Wordpress Plugin"],
        :vendor =>"RockLobster",
        :product =>"Contact Form 7",
        :match_details =>"plugin",
        :references => [],
        :match_type => :content_body,
        :match_content =>  /wpcf7-form/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :require_product => "Wordpress",
        :inference => false
      }
    ]
  end

end
end
end
end
