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
        :match_type => :content_dom,
        :dynamic_result => lambda { |d|
          return true if d["details"]["hidden_response_data"] =~ /\<form.*$/;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      }
    ]
  end
end
end
end
end
