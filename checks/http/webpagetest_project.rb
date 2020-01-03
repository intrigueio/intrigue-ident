module Intrigue
module Ident
module Check
class WebpagetestProject < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor =>"Webpagetest Project",
        :product =>"Webpagetest",
        :match_details => "title",
        :match_type => :content_title,
        :references => [
          "https://blog.assetnote.io/bug-bounty/2019/03/19/rce-on-mozilla-zero-day-webpagetest/"
        ],
        :match_content => /WebPageTest - Website Performance and Optimization Test/i,
        :version => nil,
        :paths => ["#{url}"],
        :inference => false
      }
    ]
  end

end
end
end
end
