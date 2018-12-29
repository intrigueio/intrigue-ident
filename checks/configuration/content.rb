module Intrigue
module Ident
module Check
class ContentConfiguration < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name =>"Form Detected",
        :tags => ["ContentConfig"],
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          return true if _first_body_match d,/\<form.*$/;
        false
        },
        :hide => false,
        :paths => ["#{url}"],
      }
    ]
  end
end
end
end
end
