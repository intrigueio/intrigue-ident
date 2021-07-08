module Intrigue
  module Ident
    module Check
      module Private
        class Kaseya < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Monitoring', 'Application Server'],
                vendor: 'Kaseya',
                product: 'Traverse',
                website: 'https://www.kaseya.com/products/traverse/',
                references: ['https://vuldb.com/?id.150298',
                             'https://www.cybersecurity-help.cz/vdb/SB2020021813'],
                description: 'Kaseya Traverse Application Server',
                version: nil,
                match_type: :content_headers,
                match_content: /^server:\ Traverse\ Application\ Server$/i,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Monitoring', 'Application Server'],
                vendor: 'Kaseya',
                product: 'Traverse',
                website: 'https://www.kaseya.com/products/traverse/',
                description: 'Kaseya Traverse login page',
                version: nil,
                match_type: :content_title,
                match_content: /^Traverse: Login/i,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Monitoring', 'Application Server'],
                vendor: 'Kaseya',
                product: 'Traverse',
                website: 'https://www.kaseya.com/products/traverse/',
                description: 'Kaseya Traverse powered by reference',
                version: nil,
                match_type: :content_body,
                match_content: /Powered\ By:\ Kaseya\ Traverse\ \W\ www\.kaseya\.com/i,
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Monitoring', 'Management', 'SaaS', 'Login Panel'],
                vendor: 'Kaseya',
                product: 'Virtual System Administrator',
                website: 'https://www.kaseya.com/',
                description: 'Kaseya Virtual System Administrator - initial page',
                version: nil,
                match_logic: :any,
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /<p>To continue click <a href="\/vsapres\/web20\/core\/login.aspx">here<\/a><\/p>/i
                  }
                ],
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'application',
                tags: ['Monitoring', 'Management', 'SaaS', 'Login Panel'],
                vendor: 'Kaseya',
                product: 'Virtual System Administrator',
                website: 'https://www.kaseya.com/',
                description: 'Kaseya Virtual System Administrator - Login Panel Body Match',
                version: nil,
                match_logic: :any,
                require_product: 'Virtual System Administrator',
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /\/access\/VSA_Background\.jpg/i
                  },
                  {
                    match_type: :content_body,
                    match_content: /<script src="\/vsaPres\/WebResource.axd/i
                  }
                ],
                paths: [{ path: "#{url.to_s}/vsapres/web20/core/login.aspx", follow_redirects: true }],
                dynamic_version: lambda { |x|
                  _first_body_capture(x, /<span>(\d+\.\d+\.\d+\.\d+)<\/span>/i)
                },
                inference: true
              },
              {
                type: 'fingerprint',
                category: 'service',
                tags: ['Monitoring', 'Management', 'SaaS', 'Login Panel'],
                vendor: 'Kaseya',
                product: 'Kaseya',
                website: 'https://www.kaseya.com/',
                description: 'Kaseya - Login Panel Body Match',
                version: nil,
                match_logic: :all,
                matches: [
                  {
                    match_type: :content_body,
                    match_content: /logo_kaseya.svg/i
                  },
                  {
                    match_type: :content_body,
                    match_content: /icon_K1.svg/i
                  },
                  {
                    match_type: :content_body,
                    match_content: /alt='Kaseya'/i
                  },
                  {
                    match_type: :content_body,
                    match_content: /Copyright Kaseya Limited/i
                  }
                ],
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false
              },
              {
                type: 'fingerprint',
                category: 'service',
                tags: ['Monitoring', 'Management', 'SaaS'],
                vendor: 'Kaseya',
                product: 'Kaseya',
                website: 'https://www.kaseya.com/',
                description: 'Kaseya - Favicon Hash',
                version: nil,
                match_logic: :all,
                matches: [
                  {
                    match_type: :checksum_body_mmh3,
                    match_content: -1_445_519_482
                  }
                ],
                paths: [{ path: url.to_s, follow_redirects: true }],
                inference: false,
                test_target: ['https://app.eu.myglue.com/']
              }
            ]
          end
        end
      end
    end
  end
end
