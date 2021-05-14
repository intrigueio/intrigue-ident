module Intrigue
module Ident
module Check
class VanillaForums < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "service",
        tags: ["COTS", "SaaS", "Cloud"],
        vendor:"Vanilla Forums",
        product:"Vanilla Forums",
        description:"nosy header",
        website: "https://vanillaforums.com/",
        match_type: :content_headers,
        match_content:  /x-nosy-parker64: TWF5YmUgeW91IHNob3VsZCBiZSByZWFkaW5nIHRoaXMgaW5zdGVhZDogaHR0cHM6Ly93d3cudmFuaWxsYWZvcnVtcy5jb20vZW4vY2FyZWVycw==/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
