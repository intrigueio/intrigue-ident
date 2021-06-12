module Intrigue
module Ident
module Check
class Uberflip < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["SaaS"],
        vendor:"Uberflip",
        product:"Uberflip",
        description:"missing tenant in title",
        references: ["https://help.uberflip.com/hc/en-us/articles/360018876192-Get-Started-Host-Your-Hub-on-a-Custom-Domain"],
        match_logic: :all,
        matches: [
          {
            match_type: :content_title,
            match_content:  /^Non-hub domain$/i,
          }
        ],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        hide: true
      }
    ]
  end

end
end
end
end
