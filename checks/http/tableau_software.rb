module Intrigue
module Ident
module Check
class Tableau < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Database", "COTS"],
        :vendor => "TableauSoftware",
        :product => "Tableau Server",
        :match_details => "server Header",
        :version => nil,
        :references => [],
        :match_type => :content_headers,
        :match_content =>  /server: Tableau/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Database","COTS"],
        :vendor => "TableauSoftware",
        :product => "Tableau Server",
        :match_details => "Tableau Server - unique string",
        :version => nil,
        :references => ["https://community.tableau.com/thread/165653"],
        :match_type => :content_body,
        :match_content =>  /<meta name="vizportal-config" data-buildId=/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
