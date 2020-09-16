module Intrigue
module Ident
module Check
class SubrionCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Subrion",
        :product => "Subrion CMS",
        :references => ["https://subrion.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Subrion CMS/i,
        :match_details => "Header match",
        :hide => false,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
