module Intrigue
  module Ident
    module Check
      module Private
        class Cakefoundation < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["Web Framework"],
                :vendor => "CakePHP",
                :product => "CakePHP",
                :website => "http://cakephp.org/",
                :match_details => "CakePHP - cakephp cookie",
                :version => nil,
                :match_type => :content_cookies,
                :match_content => /cakephp=/i,
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
              },
            ]
          end
        end
      end
    end
  end
end
