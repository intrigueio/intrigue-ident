module Intrigue
module Ident
module Check
class MediaTemple < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS"],
        :vendor =>"MediaTemple",
        :product =>"MediaTemple",
        :match_details =>"default string in title",
        :match_type => :content_title,
        :version => nil,
        :match_content =>  /Business-Class Web Hosting by \(mt\) Media Temple/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ], 
        :inference => false
      }
      ]
  end

end
end
end
end
