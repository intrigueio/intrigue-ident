module Intrigue
module Ident
module Check
class ContentConfiguration < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name =>"Google UA",
        :tags => ["AccountsConfig"],
        :match_type => :content_body,
        :dynamic_result => lambda { |d|
          if _body(d) =~ /gtag\(\'config\', \'[\w\d-]*\'\);/
            return _first_body_capture d, /gtag\(\'config\', \'([\w\d-]*)\'\);/
          end
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
