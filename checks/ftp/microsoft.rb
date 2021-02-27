module Intrigue
module Ident
module FtpCheck
class Microsoft < Intrigue::Ident::FtpCheck::Base

  def generate_checks
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["FTPServer"],
        vendor: "Microsoft",
        product: "FTP Service",
        references: [],
        version: nil,
        match_type: :content_banner,
        match_content: /Microsoft FTP Service/i,
        description: "banner",
        hide: false,
        inference: false
      }
    ]
  end
end
end
end
end
