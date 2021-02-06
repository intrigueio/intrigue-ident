module Intrigue
  module Ident
    module Check
      module Private
        class AvrNetIo < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["WebServer"],
                :vendor => "AVR-NET-IO",
                :product => "AVR-NET-IO",
                :references => ["https://wiki.fhem.de/wiki/AVR-NET-IO",
                                "https://github.com/fschaefer/ethersex-avr-net-io"],
                :match_details => "AVR-NET-IO - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: AVR-NET-IO(?: Application Server)?/i,
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
