module Intrigue
module Ident
module Check
class WebGUI < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "WebGUI",
        :product => "WebGUI",
        :references => ["https://www.webgui.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /WebGUI (\d......)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /WebGUI (\d......)/i)},
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
