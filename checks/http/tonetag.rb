module Intrigue
  module Ident
    module Check
      module Private
        class ToneTag < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce", "Finance"],
                :vendor => "ToneTag",
                :product => "ToneTag",
                :website => "https://www.tonetag.com/",
                :match_details => "ToneTag - _tonetag_packel_cmd_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tonetag_packel_cmd_session=/,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["E-Commerce", "Finance"],
                :vendor => "ToneTag",
                :product => "ToneTag",
                :website => "https://www.tonetag.com/",
                :match_details => "ToneTag - _tonetag_backend_session Cookie Match",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /_tonetag_backend_session=/,
                :hide => false,
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
