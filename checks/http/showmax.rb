module Intrigue
module Ident
module Check
module Private
class ShopwMax < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "service",
            :tags => ["SaaS"],
            :vendor => "Showmax",
            :product => "Showmax",
            :website => "https://www.showmax.com/eng/",
            :match_details =>"Showmax server header.",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Showmax-production$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["IAM"],
            :vendor => "Showmax",
            :product => "Showmax",
            :website => "https://www.showmax.com/eng/",
            :match_details =>"Showmax Sigle Sign on service header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Showmax-service$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["IAM"],
            :vendor => "Showmax",
            :product => "Showmax Single Sign On",
            :website => "https://www.showmax.com/eng/",
            :match_details =>"Showmax Single Sign On page",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /Welcome to Showmax Single Sign On \(SSO\) service\./,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["IAM"],
            :vendor => "Showmax",
            :product => "Showmax Single Sign On",
            :website => "https://www.showmax.com/eng/",
            :match_details =>"Showmax Single Sign On Auth cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /showmaxAuth/,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["SaaS"],
            :vendor => "Showmax",
            :product => "Showmax",
            :website => "https://www.showmax.com/eng/",
            :match_details =>"Showmax display language cookie",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /showmax\_lang/,
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
    