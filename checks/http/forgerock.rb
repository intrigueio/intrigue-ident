module Intrigue
module Ident
module Check
class ForgeRock < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library", "IAM"],
        :vendor =>"ForgeRock",
        :product =>"OpenAM",
        :match_details =>"title",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /OpenAM \(Login\)/i,
        :paths => ["#{url}"],
        :inference => false
      },
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library", "IAM"],
        :vendor =>"ForgeRock",
        :product =>"OpenAM",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /server:.*OpenAM Web Agent\/[\d\.]+$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/server:.*OpenAM Web Agent\/([\d\.]+)$/i)
        },
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
