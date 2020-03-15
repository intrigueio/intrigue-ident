module Intrigue
module Ident
module Check
class Cherokee < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "Cherokee",
        :product => "Cherokee",
        :references => ["https://cherokee-project.com/"],
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^server:\ Cherokee[\/]{0,1}(\d+\.\d+\.\d+\ \([a-zA-Z]{1,10}\)){0,1}$/,
        :dynamic_version => lambda { |x| 
          _first_header_capture(x,/^server:\ Cherokee[\/]{0,1}(\d+\.\d+\.\d+\ \([a-zA-Z]{1,10}\)){0,1}$/i) },
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
