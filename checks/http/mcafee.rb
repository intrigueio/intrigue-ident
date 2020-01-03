module Intrigue
module Ident
module Check
class Mcafee < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Administrative","COTS"],
        :vendor => "McAfee",
        :product =>"EPolicy Orchestrator",
        :match_details =>"McAfee EPolicy Orchestrator",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /McAfee Agent Activity Log/i,
        :paths => ["#{url}"], 
        :inference => false
      }
    ]
  end

end
end
end
end
