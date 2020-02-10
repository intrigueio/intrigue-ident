module Intrigue
module Ident
module Check
class Blackboard < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "CMS"],
        :vendor => "Blackboard",
        :product => "Blackboard",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-blackboard-product: Blackboard Learn &#8482;.*$/,
        :dynamic_version => lambda{|x| _first_header_capture(x,/^x-blackboard-product: Blackboard Learn &#8482; ([\w\d\.\-\+]*)$/i) },
        :paths => ["#{url}"],
        :inference => true
      },
      # Currently match_content too loose
      #{
      #  :type => "fingerprint",
      #  :category => "application",
      #  :tags => ["COTS", "CMS"],
      #  :vendor => "Blackboard",
      #  :product => "Blackboard",
      #  :match_details =>"server header",
      #  :version => nil,
      #  :match_type => :content_body,
      #  :match_content =>  /Blackboard CMS/i,
      #  :dynamic_version => nil ,
      #  :paths => ["#{url}"],
      #  :inference => true
      #}
    ]
  end

end

end
end
end
