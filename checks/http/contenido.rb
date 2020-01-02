module Intrigue
module Ident
module Check
class ContenidoCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "Contenido",
        :product => "Contenido CMS",
        :references => ["https://www.contenido.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /contenido (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /contenido (.*.\d)/i)},
        :match_details => "header match",
        :hide => false,
        :paths => ["#{url}"],
        :inference => true
      }
    ]
  end

end
end
end
end
