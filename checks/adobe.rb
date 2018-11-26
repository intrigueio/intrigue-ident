module Intrigue
module Ident
module Check
class Adobe < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "application",
        :vendor => "Adobe",
        :product => "Coldfusion",
        :version => nil,
        :match_type => :content_cookies,
        :match_content => /CFTOKEN=/,
        :match_details => "Adobe Coldfusion Cookie Match",
        :hide => false,
        :paths => ["#{url}"]
      },
      {
        :type => "application",
        :vendor => "Adobe",
        :product => "Experience Manager",
        :version => nil,
        :match_type => :content_body,
        :match_content => /AEM/,
        :match_details => "Adobe Experience Manager",
        :hide => false,
        :paths => ["#{url}/libs/granite/core/content/login.html"]
      }

    ]
  end
end
end
end
end
