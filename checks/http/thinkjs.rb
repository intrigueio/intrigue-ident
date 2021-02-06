module Intrigue
  module Ident
    module Check
      module Private
        class ThinkJS < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer", "ApplicationServer"],
                :vendor => "ThinkJS",
                :product => "ThinkJS Web Server",
                :website => "https://thinkjs.org/en",
                :references => ["https://github.com/thinkjs/thinkjs"],
                :match_details => "ThinkJS ThinkJS Web Server - X-Powered-By Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^X-Powered-By: thinkjs/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^X-Powered-By: thinkjs\-(\d+(\.\d+)*)/i)
                },
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
