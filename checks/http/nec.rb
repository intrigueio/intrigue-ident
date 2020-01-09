module Intrigue
module Ident
module Check
class Nec < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["COTS"],
        :vendor =>"NEC",
        :product =>"EXPRESSSCOPE Engine",
        :references => [
          "https://www.necam.com/Docs/?id=3fa1a888-aa74-4acb-bae0-f80f02622855"],
        :match_details =>"title",
        :version => nil,
        :match_type => :content_title,
        :match_content =>  /^EXPRESSSCOPE Engine \d*$/i,
        :dynamic_version => lambda { |x|
          _first_title_capture(x,/^EXPRESSSCOPE Engine (\d*)$/i)
        },
        :paths => ["#{url}"],
        :inference => true # not yet in the db 20190310
      }
    ]
  end

end
end
end
end
