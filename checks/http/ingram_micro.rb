module Intrigue
  module Ident
  module Check
  class IngramMicro < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "application",
          tags: ['Administrative', 'Hypervisor', 'Admin Panel'],
          vendor:"Parallels",
          product:"Odin Service Automation",
          description: "default page title",
          references: ["https://www.datacenterdynamics.com/en/news/ingram-micro-acquires-odin-service-automation-platform-from-parallels/"],
          match_logic: :all,
          matches: [
            {
              match_type: :content_title,
              match_content: /Operations Automation Default Page/,
            }
          ],
          version: nil,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false,
          test_target: ["http://www.charter-business.net/ "]
        }
      ]
    end
  end
  end
  end
  end
