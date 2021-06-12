module Intrigue
  module Ident
    module Check
      class Wftpserver < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: "fingerprint",
              category: "application",
              tags: ["COTS"],
              vendor: "Wftpserver",
              product: "Wing FTP Server",
              website: "https://www.wftpserver.com/",
              description: "server header",
              references: [],
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: /server: Wing Ftp Server/i,
                }
              ],
              dynamic_version: lambda { |x|
                _first_header_capture(x, /^server: Wing Ftp Server\/(\d+(\.\d+)*)/i)
              },
              hide: false,
              paths: [{ path: "#{url}", follow_redirects: true }],
              inference: false,
            },
          ]
        end
      end
    end
  end
end
