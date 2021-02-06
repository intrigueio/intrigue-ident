module Intrigue
module Ident
module Check
module Private
class Clearswift < Intrigue::Ident::Check::Base

    def generate_checks(url)
    [
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Security", "WAF"],
            :vendor => "Clearswift",
            :product => "Clearswift SECURE Email Gateway",
            :website => "https://www.clearswift.com/solutions/email-security",
            :match_details =>"Clearswift SECURE Email Gateway header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /^server: Clearswift$/i,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Security", "WAF"],
            :vendor => "Clearswift",
            :product => "Clearswift SECURE Email Gateway",
            :website => "https://www.clearswift.com/solutions/email-security",
            :match_details =>"Clearswift SECURE Email Gateway text header",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /Clearswift SECURE Email Gateway/,
            :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
            :inference => false
        },
        {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Security", "WAF"],
            :vendor => "Clearswift",
            :product => "Clearswift SECURE Email Gateway",
            :website => "https://www.clearswift.com/solutions/email-security",
            :match_details =>"Clearswift SECURE Email Gateway text header",
            :version => nil,
            :match_type => :content_body,
            :match_content => /Clearswift\ Ltd\.\ \((\d+\_\d+\_\d+\_\d+)\)/i,
            :dynamic_version => lambda {|x| 
                    version = _first_body_capture(x,/Clearswift\ Ltd\.\ \((\d+\_\d+\_\d+\_\d+)\)/i)
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