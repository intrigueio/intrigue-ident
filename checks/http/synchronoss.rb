module Intrigue
  module Ident
    module Check
      module Private
        class Synchronoss < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "service",
                :tags => ["Communication"],
                :vendor => "Synchronoss",
                :product => "Messaging",
                :website => "https://synchronoss.com/",
                :references => ["https://en.wikipedia.org/wiki/Critical_Path,_Inc.", "https://www.crunchbase.com/organization/openwave-messaging"],
                :match_details => "Synchronoss Messaging - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Critical Path Messaging Server version/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: Critical Path Messaging Server version (\d+(\.\d+)*)/i)
                },
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://104.209.135.166/"],
              },
            ]
          end
        end
      end
    end
  end
end
