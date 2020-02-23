module Intrigue
  module Ident
  module Check
  class Mojolicious < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["Web Framework"],
          :vendor => "Mojolicious",
          :product =>"Mojolicious",
          :match_details =>"server header",
          :match_type => :content_headers,
          :version => nil,
          :references => [],
          :dynamic_version => lambda { |x|
            _first_header_capture(x,/^server: Mojolicious \(Perl\)/i)
          },
          :match_content => /^server: Mojolicious \(Perl\)/i,
          :paths => ["#{url}"],
          :inference => false
        }
      ]
    end
  
  end
  end
  end
  end
  