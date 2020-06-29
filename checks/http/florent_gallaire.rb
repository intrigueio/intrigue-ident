module Intrigue
module Ident
module Check
class FlorentGallaire < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Florent Gallaire",
        :product => "WSGIsserver",
        :website => "https://pypi.org/project/WSGIserver/",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /Server: WSGIServer.*/i,
        :dynamic_version => lambda { |x| _first_header_capture(x, /Server: WSGIServer\/([\d\.]+)/i)},
        :match_details => "server header",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end