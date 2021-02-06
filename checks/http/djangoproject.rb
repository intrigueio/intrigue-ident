module Intrigue
  module Ident
    module Check
      module Private
        class Djangoproject < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "DjangoProject",
                :product => "Django",
                :website => "https://www.djangoproject.com/",
                :match_details => "Django - django_language cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /django_language=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "DjangoProject",
                :product => "Django",
                :website => "https://www.djangoproject.com/",
                :match_details => "Django - django_message cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /django_message=/i,
                :hide => false,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["https://www.nihms.nih.gov:443/"],
              },
            ]
          end
        end
      end
    end
  end
end
