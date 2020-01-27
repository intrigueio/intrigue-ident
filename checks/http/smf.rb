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
        :match_content => /class="new_win">SMF/i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /class="new_win">SMF (\d.*.\d)/i)},
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
