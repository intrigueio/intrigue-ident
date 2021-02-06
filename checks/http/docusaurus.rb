module Intrigue
  module Ident
    module Check
      module Private
        class Docusaurus < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Docusaurus",
                :product => "Docusaurus",
                :website => "https://docusaurus.io/",
                :match_details => "Docusaurus - generator tag page reference",
                :version => nil,
                :match_type => :content_body,
                :match_content => /<meta name="generator" content="Docusaurus/i,
                :dynamic_version => lambda { |x|
                  _first_body_capture(x, /<meta name="generator" content="Docusaurus v(\d+(\.\d+)*)/i)
                },
                :dynamic_update => lambda { |x|
                  updateDescription = _first_body_capture(x, /<meta name="generator" content="Docusaurus v(?:\d+(?:\.\d+)*)-([a-z]+)/i)
                  updateNumber = _first_body_capture(x, /<meta name="generator" content="Docusaurus v(?:\d+(?:\.\d+)*)-(?:[a-z]+\.)(\d+)/i)
                  return "#{updateDescription}#{updateNumber}" if updateNumber
                  return updateDescription
                },
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => true,
              },
            ]
          end
        end
      end
    end
  end
end
