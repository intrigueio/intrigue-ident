module Intrigue
module Ident
module Check
module Private
class Tieline < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["WebServer"],
            :vendor => "Tieline Pty Ltd",
            :product => "Tieline Toolbox",
            :website => "http://www.tieline.com/manuals/TLR5200D/en/v2_14/connecting_to_the_toolbox_web-gui_2.htm",
            :match_details =>"Tieline Toolbox server",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Tieline$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Administrative"],
            :vendor => "Tieline Pty Ltd",
            :product => "Tieline Toolbox",
            :website => "http://www.tieline.com/manuals/TLR5200D/en/v2_14/connecting_to_the_toolbox_web-gui_2.htm",
            :match_details =>"Tieline Toolbox",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /(\d+(\.\d+)*)\ -\ \W.+Tieline\ Pty\ Ltd\./i,
            :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/(\d+(\.\d+)*)\ -\ \W.+Tieline\ Pty\ Ltd\./i)
                },
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
end