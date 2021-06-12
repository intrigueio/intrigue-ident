module Intrigue
  module Ident
    module Check
      class NewRelic < Intrigue::Ident::Check::Base
        def generate_checks(url)
          [
            {
              type: 'fingerprint',
              category: 'service',
              tags: %w[APM JavaScript],
              vendor: 'New Relic',
              product: 'New Relic',
              references: ['https://discuss.newrelic.com/t/relic-solution-what-is-bam-nr-data-net-new-relic-browser-monitoring/42055'],
              description: 'NewRelic tracking code',
              version: nil,
              match_logic: :all,
              matches: [
                {
                  match_type: :content_body,
                  match_content: /bam.nr-data.net/i
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
