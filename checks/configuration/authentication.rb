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
          return false unless d["details"]["headers"]
          return true if _first_header_match d, /^www-authenticate:.*$/
        false
        },
        :hide => false,
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
          return true if _body(d) =~ /<input type=\"password\"/im;
          return true if _body(d) =~ /<script>[^>]*login/im;
          return true if _body(d) =~ /<[^>]*login/im;
          return true if _body(d) =~ /<script>[^>]*password/im;
          return true if _body(d) =~ /<script>[^>]*user/im;
          return true if _body(d) =~ /<input[^>)]*user/im;
          return true if _body(d) =~ /<input[^>)]*pass/im;
          return true if _body(d) =~ /<input[^>)]*pwd/im;
        false
        },
        :hide => false,
        :paths => ["#{url}"]
      },
      {
        :type => "configuration",
        :name =>"User Account Required",
        :tags => ["AuthenticationConfig","Heuristic"],
        :references => [],
        :match_type => :content_dom,
        :dynamic_result => lambda { |d|
          return true if _body(d) =~ /log_in/im;
          return true if _body(d) =~ /log_out/im;
          return true if _body(d) =~ /class=\"login-btn/im;
          return true if _body(d) =~ /<[^>]*login/im;
          return true if _body(d) =~ />Login<\/a>/im;
          return true if _body(d) =~ />Logout<\/a>/im;
          return true if _body(d) =~ />Log In<\/a>/im;
          return true if _body(d) =~ />Log Out<\/a>/im;
          return true if _body(d) =~ />Sign In<\/a>/im;
          return true if _body(d) =~ /sign\ in/im;
          return true if _body(d) =~ /sign_in/im;
          return true if _body(d) =~ /create an account/im;
          return true if _body(d) =~ /create_account/im;
        false
        },
        :hide => false,
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
