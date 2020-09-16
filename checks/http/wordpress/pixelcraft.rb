module Intrigue
module Ident
module Check
class WordpressBakery < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Wordpress Plugin"],
        :vendor =>"Pixelcraft",
        :product =>"Minimo",
        :references => ["https://themeforest.net/item/minimo-a-minimal-one-page-portfolio-theme/49798"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /miniBB (\d.*?)/i ,
        :dynamic_version => lambda { |x| _first_body_capture(x, /miniBB (\d.*?)/i)},
        :match_details =>"header match",
        :hide => false,
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
