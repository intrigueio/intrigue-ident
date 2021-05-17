module Intrigue
module Ident
module TcpCheck
class CiscoSmartInstall < Intrigue::Ident::TcpCheck::Base
  def generate_checks
    [
      {
        type: "fingerprint",
        category: "operating_system",
        tags: ["Tcp", "Cisco"],
        vendor: "Cisco",
        product: "Smart Install",
        references: [],
        version: nil,
        request_type: :hex,
        request_content: "\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x04\x00\x00\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00",
        #match_type: :content_banner, we don't have a match_type because we can only match whatever we get in the response
        match_content: /^\x00{3}\x04\x00{7}\x03\x00{3}\x08\x00{3}\x01\x00{4}$/i,
        description: "match via protocol hex string",
        hide: false,
        inference: false
      }
    ]
  end
end
end
end
end
