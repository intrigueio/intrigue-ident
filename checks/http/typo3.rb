module Intrigue
module Ident
module Check
class Typo3 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "TYPO3",
        :product => "TYPO3",
        :match_details => "generator tag",
        :version => nil,
        :match_type => :content_generator,
        :match_content =>  /TYPO3 CMS/i,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
