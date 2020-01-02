module Intrigue
module Ident
module Check
class AspNetForum < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Web Server"],
        :vendor => "JitBit",
        :product => "AspNetForum",
        :references => ["https://www.jitbit.com/asp-net-forum/"],
        :version => nil,
        :match_type => :content_body,
        :match_content => /AspNetForum v.(\d.*?)<\//i,
        :dynamic_version => lambda { |x| _first_body_capture(x, /AspNetForum v.(\d.*?)<\//i)},
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
