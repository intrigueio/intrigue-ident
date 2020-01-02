module Intrigue
module Ident
module Check
class OpenTextWebSolutionsCMS < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["CMS"],
        :vendor => "OpenText",
        :product => "Open Text Web Solutions",
        :references => ["https://www.opentext.com/products-and-solutions/products/customer-experience-management/web-content-management/web-site-management"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /published by open text web solutions (.*.\d)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /published by open text web solutions (.*.\d)/i)},
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
