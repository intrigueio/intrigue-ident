module Intrigue
module Ident
module FtpCheck
class Acronis < Intrigue::Ident::FtpCheck::Base

  def generate_checks
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["FTPServer"],
        vendor: "Acronis",
        product: "MassTransit",
        references: [""],
        website: "https://www.acronis.com/",
        match_type: :content_banner,
        match_content: /220 MassTransit FTP server \(version [\d\.]+\) ready.\r\n/i,
        dynamic_version: lambda { |x| _first_banner_capture(x, /220 MassTransit FTP server \(version ([\d\.]+)\) ready.\r\n/i)},
        description: "banner",
        inference: true
      }
    ]
  end
end
end
end
end
