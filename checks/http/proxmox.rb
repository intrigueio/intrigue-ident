module Intrigue
  module Ident
    module Check
      class Proxmox < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Hypervisor', 'Login Panel'],
              vendor: 'Proxmox Server Solutions',
              product: 'Proxmox Virtual Environment',
              website: 'https://www.proxmox.com/en/proxmox-ve',
              references: [],
              description: 'Proxmox Virtual Environment - Login panel',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_title,
                  match_content: /Proxmox Virtual Environment/,
                },
                {
                  match_type: :content_body,
                  match_content: /PVEAuthCookie/,
                }
              ],
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
