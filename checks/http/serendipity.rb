module Intrigue
module Ident
module Check
class Serendipity < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Serendipity",
        :product => "Serendipity",
        :references => ["https://docs.s9y.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /Serendipity v.(.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /Serendipity v.(.*.\d)/i)},
        :match_details => "Header match",
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
