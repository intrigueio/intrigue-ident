module Intrigue
  module Ident
    module Check
      module Private
        class AudioCodes < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "AudioCodes",
                :product => "AudioCodes Web Server",
                :website => "http://audiocodes.com/",
                :match_details => "AudioCodes AudioCodes Web Server - Server Header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^Server: AudioCodes Web Server/,
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
