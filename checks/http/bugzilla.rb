module Intrigue
  module Ident
    module Check
      module Private
        class Bugzilla < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Issue Tracker"],
                :vendor => "Mozilla",
                :product => "Bugzilla",
                :website => "http://www.bugzilla.org/",
                :match_details => "Bugzilla - Bugzilla_login_request_cookie cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /Bugzilla_login_request_cookie=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Issue Tracker"],
                :vendor => "Mozilla",
                :product => "Bugzilla",
                :website => "http://www.bugzilla.org/",
                :match_details => "Bugzilla - generator page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Bugzilla/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Bugzilla (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
