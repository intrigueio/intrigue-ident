module Intrigue
module Ident
module Check
class Jquery < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "JQuery",
        :product =>"JQuery",
        :match_details =>"filename",
        :match_type => :content_body,
        :version => nil,
        :references => [],
        :match_content =>  /script\ src=[\"|\']https:\/\/code\.jquery\.com\/jquery-/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "JQuery",
        :product =>"Datatables",
        :match_details =>"filename",
        :match_type => :content_body,
        :version => nil,
        :references => [],
        :match_content =>  /jquery\.dataTables\.min\.js[\"|\']\>/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Javascript"],
        :vendor => "JQuery",
        :product =>"JQuery",
        :match_details =>"filename",
        :match_type => :content_body,
        :version => nil,
        :references => [],
        :match_content =>  /src=.*?\/jquery-([\d\.]+).js\"\>/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /src=.*?\/jquery-([\d\.]+).js\"\>/i)},
        :paths => ["#{url}"],
        :inference => true
      }
      
    ]
  end

end
end
end
end
