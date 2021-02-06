module Intrigue
    module Ident
      module Check
        module Private
          class Chorus < Intrigue::Ident::Check::Base
            def generate_checks(url)
              [
                {
                  :type => "fingerprint",
                  :category => "service",
                  :tags => ["CMS"],
                  :vendor => "Chorus",
                  :product => "Chorus",
                  :website => "https://getchorus.voxmedia.com/",
                  :match_details => "Chorus - data-chorus-version meta tag page reference",
                  :version => nil,
                  :match_type => :content_body,
                  :match_content => /<meta data-chorus-version=/i,
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
  