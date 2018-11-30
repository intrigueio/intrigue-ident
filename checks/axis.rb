module Intrigue
module Ident
module Check
class Axis < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "operating_system",
        :tags => ["Embedded", "Webcam"],
        :vendor => "Axis",
        :product => "Network Camera Firmware",
        :match_details =>"default redirect uri",
        :version => nil,
        :match_type => :content_body,
        :match_content =>  /<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0; URL=\/view\/viewer_index.shtml?id=/,
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
