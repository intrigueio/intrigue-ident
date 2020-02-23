module Intrigue
module Ident
module Check
class Atlassian < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"BitBucket",
        :match_details =>"Atlassian BitBucket",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /com.atlassian.bitbucket.server/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"Confluence",
        :match_details =>"Atlassian Confluence",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /X-Confluence-Request-Time/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"Crucible",
        :match_details =>"Atlassian Crucible",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /FishEye and Crucible/,
        :dynamic_version => lambda{ |x|
          _first_body_capture(x, /Log in to FishEye and Crucible (.*)\</)
        },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"Hipchat",
        :match_details =>"Atlassian Hipchat",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /\$\(document\).trigger\('hipchat.load'\);/,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"Jira",
        :match_details =>"Atlassian Jira",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /jira.webresources/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS", "Development"],
        :vendor => "Atlassian",
        :product =>"Jira",
        :match_details =>"Atlassian Jira",
        :version => nil,
        :match_type => :content_cookies,
        :match_content =>  /atlassian.xsrf.token=/i,
        :dynamic_version => lambda{ |x|
            _first_body_capture(x,/<meta name="ajs-version-number" content="(.*)">/) },
        :paths => ["#{url}"],
        :inference => true
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "Development"],
        :vendor => "Atlassian",
        :product =>"Statuspage",
        :match_details =>"statuspage icon",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /logos-statuspage-logo-gradient-neutral.svg/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "Development", "Proxy"],
        :vendor => "Atlassian",
        :product =>"Proxy",
        :references => ["https://community.atlassian.com/t5/Jira-questions/REST-API-not-returning-any-data-with-API-token/qaq-p/1292806"],
        :match_details =>"proxy server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /^server: AtlassianProxy\/[\d\.]+$/i,
        :dynamic_version => lambda{ |x|
          _first_header_capture(x,/^server: AtlassianProxy\/([\d\.]+)$/i) },
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "Development"],
        :vendor => "Atlassian",
        :product =>"Statuspage",
        :match_details =>"statuspage header",
        :version => nil,
        :match_type => :content_heades,
        :match_content =>  /^x-statuspage-skip-logging:.*$/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS", "Development"],
        :vendor => "Atlassian",
        :product =>"Statuspage",
        :match_details =>"statuspage header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^x-statuspage-version:.*$/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end
  
end
end
end
end
