module Intrigue
  module Ident
    module Check
      module Private
        class Smartertools < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "Smartertools",
                :product => "Smartermail",
                :website => "https://www.smartertools.com/",
                :match_details => "Smartertools - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Smartertools/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /^server: Smartertools\/(\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "Smartertools",
                :product => "Smartermail",
                :website => "https://www.smartertools.com/",
                :match_details => "Smartertools - powered by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<a href="http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx" target="_blank">SmarterMail Enterprise/i,
                :dynamic_version => lambda { |x|
                  _first_header_capture(x, /<a href="http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx" target="_blank">SmarterMail Enterprise (\d+(\.\d+)*)/i)
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Mail Server"],
                :vendor => "Smartertools",
                :product => "Smartermail",
                :website => "https://www.smartertools.com/",
                :match_details => "Smartertools - title by page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /SmarterMail Login - SmarterMail/i,
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
