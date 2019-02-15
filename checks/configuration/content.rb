module Intrigue
module Ident
module Check
class Content < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name =>"Account Details - Google Urchin",
        :tags => ["AccountConfig"],
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          if _body(d) =~ /gtag\(\'config\', \'[\w\d-]*\'\);/
            return _first_body_capture d, /gtag\(\'config\', \'([\w\d-]*)\'\);/
          end
        false
        },
        :hide => false,
        :paths => ["#{url}"],
      },
      {
        :type => "configuration",
        :name =>"Content - Directory Listing",
        :tags => ["ContentConfig"],
        :match_type => :content_title,
        :dynamic_result => lambda { |d| _first_title_match(d,/Index of \//) ? true : false },
        :hide => false,
        :paths => ["#{url}"],
        :finding => true
      },
      {
        :type => "configuration",
        :name =>"Content - Form Detected",
        :tags => ["ContentConfig"],
        :match_type => :content_body,
        :dynamic_result => lambda { |d| _first_body_match(d,/\<form.*$/) ? true : false },
        :paths => ["#{url}"],
        :hide => false
      }
    ]
  end
end
end
end
end
