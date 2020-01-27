module Intrigue
module Ident
module Check
class SimpleMachineForum < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Forum builder"],
        :vendor => "Simple Machine Forum",
        :product => "SMF",
        :references => ["https://www.simplemachines.org/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /SMF ([\d\.]+s)/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /SMF ([\d\.]+)/i)},
        :match_details => "body match",
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
