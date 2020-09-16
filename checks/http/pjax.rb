module Intrigue
module Ident
module Check
class Pjax < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Javascript"],
        :vendor =>"pjax",
        :product =>"pjax",
        :match_details =>"header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-pjax:.*/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["Javascript"],
        :vendor =>"pjax",
        :product =>"pjax",
        :match_details =>"vary header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^vary:.*x-pjax.*/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
