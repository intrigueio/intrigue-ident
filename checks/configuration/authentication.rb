module Intrigue
module Ident
module Check
class AuthConfiguration < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "configuration",
        :name =>"HTTP Authentication Detected",
        :tags => ["AuthenticationConfig"],
        :match_type => :content_headers,
        :dynamic_result => lambda { |d|
          return true if d["details"]["headers"].join("\n") =~ /^www-authenticate:.*$/;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      },
      {
        :type => "configuration",
        :name =>"Form Authentication Detected",
        :tags => ["AuthenticationConfig"],
        :references => [
          "https://webstersprodigy.net/2010/04/07/nmap-script-to-try-and-detect-login-pages/",
          "https://nmap.org/nsedoc/scripts/http-auth-finder.html"
        ],
        :match_type => :content_dom,
        :dynamic_result => lambda { |d|
          body = d["details"]["hidden_response_data"]
          return true if body =~ /<input type=\"password\"/im;
          return true if body =~ /<script>[^>]*login/im;
          return true if body =~ /<[^>]*login/im;
          return true if body =~ /<script>[^>]*password/im;
          return true if body =~ /<script>[^>]*user/im;
          return true if body =~ /<input[^>)]*user/im;
          return true if body =~ /<input[^>)]*pass/im;
          return true if body =~ /<input[^>)]*pwd/im;
        false
        },
        :hide => true,
        :paths => ["#{url}"],
      }
    ]
  end
end
end
end
end
