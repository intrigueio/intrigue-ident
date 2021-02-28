module Intrigue
module Ident
module Check
class Contenido < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
=begin 
      # Currently match_content too loose
      {
        type: "fingerprint",
        category: "application",
        tags: ["CMS"],
        vendor: "Contenido",
        product: "Contenido CMS",
        references: ["https://www.contenido.org/"],
        version: nil,
        match_type: :content_generator,
        match_content: /CMS Contenido/i,
        dynamic_version: lambda { |x| _first_generator_capture(x, /CMS Contenido ([\d\.]+)/i)},
        description: "generator tag",
        hide: false,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: true
      }
=end
    ]
  end

end
end
end
end
