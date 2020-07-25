module Intrigue
module Ident
module Check
  class Drupal < Intrigue::Ident::Check::Base

    def generate_checks(url)
      [
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :match_details => "Drupal version in page content",
          :version => nil,
          :match_type => :content_body,
          :match_content => /^Drupal [0-9]+\.[0-9]+/,
          :dynamic_version => lambda { |x|
            _first_body_capture(x,/^Drupal ([0-9\.]*?)[ ,<\.].*$/)
          },
          :paths => ["#{url}/CHANGELOG.txt"],
          :require_product => "Magento",
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :references => ["https://twitter.com/bad_packets/status/1098843918127398912"],
          :version => 8, #default to 8
          :match_details => "Drupal version in page content",
          :match_type => :content_body,
          :match_content => /^Drupal [0-9]+\.[0-9]+/,
          :dynamic_version => lambda { |x|
            _first_body_capture(x,/^Drupal ([0-9\.]*?)[ ,<\.].*$/)
          },
          :paths => ["#{url}/core/CHANGELOG.txt"],
          :require_product => "Magento",
          :inference => true
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :match_details => "Drupal headers",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-drupal/i,
          :paths => ["#{url}"],
          :inference => false
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :match_details => "Drupal headers",
          :version => nil,
          :match_type => :content_headers,
          :match_content =>  /x-generator: Drupal/,
          :dynamic_version => lambda { |x|
            _first_header_capture(x,/x-generator: Drupal\ ([0-9]+)\ \(/i,)
          },
          :paths => ["#{url}"],
          :inference => false # Not specific enough?
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :match_details => "generator tag",
          :version => 7,
          :match_type => :content_generator,
          :match_content =>  /Drupal 7 \(http:\/\/drupal.org\)/,
          :paths => ["#{url}"],
          :inference => false # Not specific enough?
        },
        {
          :type => "fingerprint",
          :category => "application",
          :tags => ["CMS"],
          :vendor => "Drupal",
          :product => "Drupal",
          :match_details => "generator tag",
          :version => 8,
          :match_type => :content_generator,
          :match_content =>  /Drupal 8 \(http:\/\/drupal.org\)/,
          :paths => ["#{url}"],
          :inference => false # Not specific enough?
        }
      ]
    end

  end
end
end
end
