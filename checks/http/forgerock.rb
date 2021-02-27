module Intrigue
module Ident
module Check
class ForgeRock < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Library", "IAM"],
        vendor:"ForgeRock",
        product:"OpenAM",
        description:"title",
        version: nil,
        match_type: :content_title,
        match_content:  /OpenAM \(Login\)/i,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Library", "IAM"],
        vendor:"ForgeRock",
        product:"OpenAM",
        description:"server header",
        version: nil,
        match_type: :content_headers,
        match_content:  /server:.*OpenAM Web Agent\/[\d\.]+$/i,
        dynamic_version: lambda { |x|
          _first_header_capture(x,/server:.*OpenAM Web Agent\/([\d\.]+)$/i)
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
    ]
  end

end
end
end
end
