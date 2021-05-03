module Intrigue
  module Ident
    module Check
      class Vmware < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Hypervisor'],
              vendor: 'VMware',
              product: 'ESXi',
              website: 'https://www.vmware.com/uk/products/esxi-and-esx.html',
              description: 'unique page string',
              version: nil,
              match_type: :content_body,
              match_content: /document.write\("<title>"\ \+\ ID_EESX_Welcome/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false,
              issue: 'exposed_admin_panel_unauthenticated'
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Hypervisor'],
              vendor: 'VMware',
              product: 'ESXi',
              website: 'https://www.vmware.com/uk/products/esxi-and-esx.html',
              description: 'unique page string',
              version: nil,
              match_type: :content_body,
              match_content: %r{client/VMware-viclient\.exe}i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Hypervisor'],
              vendor: 'VMware',
              product: 'Horizon View',
              website: 'https://my.vmware.com/en/web/vmware/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8',
              description: 'page title',
              version: nil,
              match_type: :content_body,
              match_content: /<title>VMware Horizon/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Hypervisor'],
              vendor: 'VMware',
              product: 'vSphere',
              website: 'https://www.vmware.com/uk/products/vsphere.html',
              description: 'page title',
              version: nil,
              match_type: :content_body,
              match_content: /document.write\("<title>"\ \+\ ID_VC_Welcome/,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Cloud Management],
              vendor: 'VMware',
              product: 'vRealize Operations Manager',
              website: 'https://www.vmware.com/uk/products/vrealize-operations.html',
              description: 'page title',
              references: [],
              version: nil,
              match_type: :content_body,
              match_content: %r{<title>vRealize Operations Manager</title>},
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            },
            {
              type: 'fingerprint',
              category: 'application',
              tags: %w[Cloud Management],
              vendor: 'VMware',
              product: 'vRealize Operations Tenant App',
              description: 'page title',
              references: ['https://blogs.vmware.com/cloudprovider/2020/10/vrealize-operations-tenant-app-2-5.html'],
              version: nil,
              match_type: :content_body,
              match_content: %r{<title>vRealize Operations Tenant App</title>},
              hide: false,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: true
            }
          ]
        end
      end
    end
  end
end
