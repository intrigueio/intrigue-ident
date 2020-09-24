module Intrigue
module Ident
module Check
class EforumFactory < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "eForum Factory",
        :product => "eForum Factory",
        :website => "https://www.eforumfactory.be/",
        :version => nil,
        :match_type => :content_body,
        :match_content => /title="The eForum Factory".*\>/i,
        :dynamic_version => nil,
        :match_details => "unique body string",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end


