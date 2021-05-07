module Intrigue
  module Ident
    module Check
      class Rails < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'application',
              tags: ['Application Server'],
              vendor: 'RubyOnRails',
              product: 'Rails',
              website: 'https://rubyonrails.org/',
              version: nil,
              description: 'in-page authenticity token (csrf-param)',
              match_type: :content_body,
              match_content: /meta content="authenticity_token" name="csrf-param/i,
              paths: [{ path: url.to_s, follow_redirects: true }],
              inference: false
            }
          ]
        end
      end
    end
  end
end
