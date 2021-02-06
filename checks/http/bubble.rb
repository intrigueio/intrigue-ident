module Intrigue
    module Ident
    module Check
    module Private
    class Buble < Intrigue::Ident::Check::Base
    
        def generate_checks(url)
        [
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-request-took headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-request-took:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-perf headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-perf:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-capacity-used headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-capacity-used:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-capacity-limit headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-capacity-limit:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-breaking-revision headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-breaking-revision:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-r headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-r:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-PL headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-PL:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-fiber-id headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-fiber-id:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - x-bubble-utm-data headers",
                :version => nil,
                :match_type => :content_headers,
                :match_content =>  /^x-bubble-utm-data:/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - javascript page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /window._bubble_page_load_data = \{\}/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false
            },
            {
                :type => "fingerprint",
                :category => "service",
                :tags => ["CMS", "Web Framework"],
                :vendor => "Bubble",
                :product => "Bubble",
                :website => "http://bubble.is/",
                :match_details =>"Bubble - Zeroqode page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content =>  /content=.Zeroqode - #1 No-Code developer\. We build affordable web and mobile apps using Bubble\.io - a visual programming platform\../i,
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
    