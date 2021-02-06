module Intrigue
module Ident
module Check
module Private
class Axigen < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "Mail Server"],
            :vendor => "Axigen",
            :product => "Axigen WebMail",
            :website => "https://www.axigen.com/",
            :match_details =>"Axigen WebMail header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Axigen-Webmail$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "Mail Server"],
            :vendor => "Axigen",
            :product => "Axigen WebMail",
            :website => "https://www.axigen.com/",
            :match_details =>"Axigen WebMail title",
            :version => nil,
            :match_type => :content_title,
            :match_content =>  /^Axigen WebMail$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Collaboration", "Mail Server"],
            :vendor => "Axigen",
            :product => "Axigen WebMail",
            :website => "https://www.axigen.com/",
            :match_details =>"Axigen WebMail footer",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<p class=\"powered-by\">Powered by <a target=\"blank\" href=\"https:\/\/www\.axigen\.com\/.*">Axigen<\/a><\/p>/,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Proxy"],
            :vendor => "Axigen",
            :product => "WebMail Proxy Service",
            :website => "https://www.axigen.com/documentation/configuring-the-webmail-proxy-service-p1410701",
            :match_details =>"Axigen WebMail Proxy Service",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server:\ Axigen-Webproxy$/,
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