module Intrigue
module Ident
module Check
class Loxone < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["IoT"],
        vendor: "Loxone",
        product:"Smart Home Web Interface",
        description: "favicon hash",
        references: ["https://www.reddit.com/r/ShodanNinja/comments/96oh0f/shodan_search_httpfaviconhash679065580_loxone/"],
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :checksum_body_mmh3,
            match_content: 679065580,
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