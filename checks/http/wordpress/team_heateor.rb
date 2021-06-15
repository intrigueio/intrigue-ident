module Intrigue
module Ident
module Check
class WordpressTeamHeateor < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Wordpress Plugin", "Social"],
        vendor:"Wordpress",
        product:"Sassy-Social-Share",
        description:"plugin",
        references: [],
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /wp-content\/plugins\/sassy-social-share\/public\/js\/sassy-social-share-public\.js\?ver=/i,
          }
        ],
        dynamic_version: lambda { |x|
          _first_body_capture(x,/wp-content\/plugins\/sassy-social-share\/public\/js\/sassy-social-share-public.js?ver=([\d\.]+)/ii)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        require_product: "Wordpress",
        inference: false
      }
    ]
  end

end
end
end
end
