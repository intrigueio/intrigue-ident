module Intrigue
module Ident
module Check
class Jarallax < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Javascript"],
        vendor: "Jarallax",
        product: "Jarallax",
        website: "https://github.com/nk-o/jarallax",
        match_type: :content_body,
        match_content: /data-jarallax-video\'/i,
        description: "javascript class load",
        paths: [ { path: "#{url}", follow_redirects: true } ]
      }
    ]
  end

end
end
end
end


