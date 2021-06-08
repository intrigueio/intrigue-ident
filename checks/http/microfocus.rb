module Intrigue
  module Ident
    module Check
      class MicroFocus < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: ['Web Server'],
              vendor: 'MicroFocus',
              product: 'BSM',
              references: ['https://docs.microfocus.com/SM/9.60/Codeless/Content/integrations/business_service_management/concepts/hp_business_service_management.htm'],
              version: nil,
              description: 'MicroFocus BSM - Server Header',
              match_logic: :all,
              matches: [
                {
                  match_type: :content_headers,
                  match_content: %r{^server:\ DPS/[\d.]{1,}$}i,
                }
              ],
              dynamic_version: lambda { |x|
                                 _first_header_capture(x, %r{^server:\ DPS/[\d.]{1,}$}i)
                               },
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
