module Intrigue
  module Ident
    module Check
      module Private
        class Cmsmadesimple < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "CMSMadeSimple",
                :product => "CMS Made Simple",
                :website => "http://cmsmadesimple.org/",
                :match_details => "CMS Made Simple - generator page reference",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /<meta name="generator" content="CMS Made Simple/i,
                :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
