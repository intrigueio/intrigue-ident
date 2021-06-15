module Intrigue
module Ident
module Check
class Typo3 < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "TYPO3",
        product: "TYPO3",
        website: "https://typo3.org/",
        description: "TYPO3 - generator page reference",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /<meta name="generator" content="TYPO3 CMS">/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
