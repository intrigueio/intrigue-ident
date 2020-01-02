module Intrigue
module Ident
module Check
class DanneoCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Danneo",
        :product => "Danneo",
        :references => ["http://danneo.ru/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /CMS Danneo (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /CMS Danneo (.*.\d)/i)},
        :match_details => "header match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
