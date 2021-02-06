module Intrigue
    module Ident
    module Check
    module Private
    class Sucuri < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "WAF", "Security"],
                :vendor => "Sucuri Inc",
                :product => "Website Application Firewall",
                :website => "https://sucuri.net/website-firewall/",
                :match_details =>"Sucuri Website Application Firewall - page title reference",
                :version => nil,
                :match_type => :content_title,
                :match_content =>  /^Sucuri WebSite Firewall/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["SaaS", "WAF", "Security"],
                :vendor => "Sucuri Inc",
                :product => "Website Application Firewall",
                :website => "https://sucuri.net/website-firewall/",
                :match_details =>"Sucuri Website Application Firewall - copyright reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /\W\ 2019\ Sucuri\ Inc\.\ All\ rights\ reserved\./i,
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