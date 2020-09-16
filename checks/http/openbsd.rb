module Intrigue
module Ident
module Check
class Openbsd < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Library"],
        :vendor =>"OpenBSD",
        :product =>"LibreSSL",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /^.*LibreSSL\/.*$/i,
        :dynamic_version => lambda { |x|
          _first_header_capture(x,/^.*LibreSSL\/([\w\d\.\-]*)\s.*$/i)
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => true
      }
    ]
  end

end
end
end
end
