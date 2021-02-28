module Intrigue
module Ident
module SnmpCheck
class Cisco < Intrigue::Ident::SnmpCheck::Base
  # Cisco NX-OS(tm) ucs, Software (ucs-6100-k9-system), Version 5.0(3)N2(3.22c), RELEASE SOFTWARE Copyright (c) 2002-2013 by Cisco Systems, Inc.   Compiled 12/14/2017 11:00:00

  def generate_checks 
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["SNMPServer", "Networking", "Router"],
        vendor: "Cisco",
        product: "IOS XE",
        references: [],
        version: nil,
        match_type: :content_banner,
        match_content: /Virtual XE Software/i,
        dynamic_version: lambda { |x| _first_banner_capture(x, /Version (.*), RELEASE SOFTWARE/i)},
        description: "banner",
        hide: false,
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["SNMPServer", "Networking", "Router"],
        vendor: "Cisco",
        product: "IOS XE",
        references: [],
        version: nil,
        match_type: :content_banner,
        match_content: /^Cisco IOS Software, IOS-XE Software/i,
        dynamic_version: lambda { |x| _first_banner_capture(x, /Version (.*), RELEASE SOFTWARE/i)},
        description: "banner",
        hide: false,
        inference: true
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["SNMPServer", "Networking", "Router"],
        vendor: "Cisco",
        product: "NX-OS",
        references: [],
        version: nil,
        match_type: :content_banner,
        match_content: /^Cisco NX-OS\(tm\) ucs/i,
        dynamic_version: lambda { |x| _first_banner_capture(x, /^Cisco NX-OS\(tm\) ucs, Software ([\w\-\d]+), Version ([\d\.\(\)\w]+),.*$/i)},
        description: "banner",
        hide: false,
        inference: true
      }
    ]
  end
end
end
end
end
