module Intrigue
module Ident
module Check
class Various < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "content",
        :name =>"Google Urchin Account",
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          if _body(d) =~ /gtag\(\'config\', \'[\w\d-]*\'\);/
            return _first_body_capture d, /gtag\(\'config\', \'([\w\d-]*)\'\);/
          end
        false
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name =>"Directory Listing",
        :match_type => :content_title,
        :dynamic_result => lambda { |d| _first_title_match(d,/Index of \//) ? true : false },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name =>"Form",
        :match_type => :content_body,
        :dynamic_result => lambda { |d| _first_body_match(d,/\<form/) ? true : false },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name =>"File Upload Form",
        :match_type => :content_body,
        :dynamic_result => lambda { |d| _first_body_match(d,/enctype=\"multipart\/form-data/) ? true : false },
        :paths => ["#{url}"],
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
      },
      {
        :type => "content",
        :name =>"Email Addresses",
        :match_type => :content_title,
        :dynamic_result => lambda { |d| _all_body_captures(d,/([a-zA-Z0-9_\-\.]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{2,5})/) },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
