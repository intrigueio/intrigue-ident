module Intrigue
  module Ident
    module Check
      module Private
        class Spincms < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "SpinCMS",
                :product => "SpinCMS",
                :website => "http://www.spin.cw/",
                :match_details => "SpinCMS - spincms_session cookies",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /spincms_session=/i,
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
