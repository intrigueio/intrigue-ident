module Intrigue
module Ident
module Check
class PivotalSoftware < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"Pivotal Software",
        :product =>"Spring Framework",
        :match_details =>"Standard Spring MVC error page",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /\{\"timestamp\":\d.*,\"status\":999,\"error\":\"None\",\"message\":\"No message available\"\}/,
        :paths => [{ :path => "#{url}/error.json", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"Pivotal Software",
        :product =>"Spring Framework",
        :match_details =>"spring cache header",
        :references => ["https://github.com/atramos/springy-aws"],
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /^x-springy-cache-disabled:.*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :examples => ["x-springy-cache-disabled: 0"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Framework"],
        :vendor =>"Pivotal Software",
        :product =>"Spring Boot",
        :match_details =>"spring cache header",
        :references => ["https://stackoverflow.com/questions/40379550/what-is-x-application-context-header"],
        :match_type => :content_headers,
        :version => nil,
        :match_content =>  /^X-Application-Context.*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development", "Database"],
        :vendor => "Pivotal Software",
        :product => "RabbitMQ",
        :match_details =>"RabbitMQ",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /RabbitMQ Management/,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Development", "Database"],
        :vendor => "Pivotal Software",
        :product => "RabbitMQ",
        :match_details => "RabbitMQ API",
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /RabbitMQ Management HTTP API/,
        :paths => [{ :path => "#{url}/api", :follow_redirects => true } ],
        :inference => false
      }, 
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["App Server"],
        :vendor =>"Pivotal Software",
        :product =>"tc server",
        :match_details =>"body version string",
        :references => ["https://www.vmware.com/products/pivotal-tcserver.html"],
        :match_type => :content_body,
        :version => nil,
        :match_content =>  /Pivotal tc Server Standard Edition [\d\.]+\.RELEASE/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Pivotal tc Server Standard Edition\ ([\d\.]+)\.RELEASE/i)},
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
