module Intrigue
module Ident
module Check
class Contenido < Intrigue::Ident::Check::Base

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
<<<<<<< HEAD
        :match_type => :content_body,
        :match_content => /contenido (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /contenido (\d.*.\d)/i)},
        :match_details => "header match",
=======
        :match_type => :content_generator,
        :match_content => /CMS Contenido/i,
        :dynamic_version => lambda { |x| _first_generator_capture(x, /CMS Contenido ([\d\.]+)/i)},
        :match_details => "generator tag",
>>>>>>> master
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
