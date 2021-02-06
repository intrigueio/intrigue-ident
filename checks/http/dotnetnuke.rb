module Intrigue
module Ident
module Check
module Private
class Dotnetnuke < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - x-compressed-by header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^x\-compressed\-by:\ DotNetNuke(\-Compression)?$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - DNNOutputCache header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^DNNOutputCache/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - DotNetNukeAnonymous cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /DotNetNukeAnonymous=/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - dnn_IsMobile cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /dnn_IsMobile=/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - generator page reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta id="MetaGenerator" name="GENERATOR" content="DotNetNuke\s?"\s\/>/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - metakeywords page reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<meta id="MetaKeywords" name="KEYWORDS" content=",DotNetNuke,DNN"\s\/>/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - dnncore.js script",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<script src="\/js\/dnncore\.js" type="text\/javascript"><\/script>/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - dnn.js script",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<script src="\/js\/dnn\.js" type="text\/javascript"><\/script>/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["HTTP Compression"],
            :vendor => "DNNSoftware",
            :product => "DotNetNuke",
            :website => "https://www.dnnsoftware.com/wiki/compression",
            :match_details => "DotNetNuke - page comment reference",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<!\-*\s*(DotNetNuke.?|DNN Platform)\s*-\s*(https?:\/\/www\.(dotnetnuke|dnnsoftware)\.com)\s*-*>/i,
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
            