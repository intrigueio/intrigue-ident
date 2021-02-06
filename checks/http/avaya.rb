module Intrigue
module Ident
module Check
module Private
class Avaya < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "VoIP"],
            :vendor => "Avaya Inc",
            :product => "IP Office",
            :website => "https://www.avaya.com/en/products/unified-communications/voip/",
            :match_details =>"IP Office server header.",
            :version => nil,
            :match_type => :content_headers,
            :match_content => /^server: IPOffice\/$/,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "VoIP"],
            :vendor => "Avaya Inc",
            :product => "IP Office",
            :website => "https://www.avaya.com/en/products/unified-communications/voip/",
            :match_details =>"IP Office title reference.",
            :version => nil,
            :match_type => :content_title,
            :match_content => /^About\ IP\ Office\ (R\d\.\d)$/,
            :dynamic_version => lambda {|x| 
                    version = _first_title_capture(x,/About\ IP\ Office\ (R\d\.\d)$/i)
                },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "VoIP"],
            :vendor => "Avaya Inc",
            :product => "IP Office",
            :website => "https://www.avaya.com/en/products/unified-communications/voip/",
            :match_details =>"IP Office body reference.",
            :version => nil,
            :match_type => :content_body,
            :match_content => /IP\ Office\ (R\d\.\d)/i,
            :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/IP\ Office\ (R\d\.\d)/i)
                },
            :hide => false,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => true
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "VoIP"],
            :vendor => "Avaya Inc",
            :product => "IP Office",
            :website => "https://www.avaya.com/en/products/unified-communications/voip/",
            :match_details =>"IP Office copyright.",
            :version => nil,
            :match_type => :content_body,
            :match_content => /\W\ \d{4}\ Avaya\ Inc\./i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        }
    ]
    end
end
end
end
end
end