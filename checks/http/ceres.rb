module Intrigue
    module Ident
      module Check
        module Private
          class Ceres < Intrigue::Ident::Check::Base
            def generate_checks(url)
              [
                {
                  :type => "fingerprint",
                  :category => "service",
                  :tags => ["CMS"],
                  :vendor => "Ceres",
                  :product => "Ceres",
                  :website => "https://getCeres.voxmedia.com/",
                  :match_details => "Ceres - data-Ceres-version meta tag page reference",
                  :version => nil,
                  :match_type => :content_body,
                  :match_content => /<meta data-Ceres-version=/i,
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
  