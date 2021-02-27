module Intrigue
module Ident
module Check
class Authentication < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        type: "content",
        name: "Authentication - HTTP",
        dynamic_result: lambda { |d|
          return false unless d["details"]["headers"]
          return true if _first_header_match(d, /^www-authenticate:.*$/)
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name: "Authentication - NTLM",
        dynamic_result: lambda { |d|
          return false unless d["details"]["headers"]
          return true if _first_header_match(d, /^www-authenticate: NTLM$/i)
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name:"Authentication - Forms",
        references: [
          "https://webstersprodigy.net/2010/04/07/nmap-script-to-try-and-detect-login-pages/",
          "https://nmap.org/nsedoc/scripts/http-auth-finder.html"
        ],
        dynamic_result: lambda { |d|
          return true if _body(d) =~ /<input type=\"password\"/im;
          return true if _body(d) =~ /<script>[^>]*login/im;
          return true if _body(d) =~ /<[^>]*login/im;
          return true if _body(d) =~ /<script>[^>]*password/im;
          return true if _body(d) =~ /<script>[^>]*user/im;
          return true if _body(d) =~ /<input[^>)]*user/im;
          return true if _body(d) =~ /<input[^>)]*pass/im;
          return true if _body(d) =~ /<input[^>)]*pwd/im;
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
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
      {
        type: "content",
        name: "Authentication - Session Identifier",
        references: [
          "https://github.com/fuzzdb-project/fuzzdb/blob/ecb0850538bc9152949fa4579654d6b64e2fdb97/regex/sessionid.txt"
        ],
        dynamic_result: lambda { |d|
          return false unless d["details"]["cookies"]
          return true if _first_cookie_match d, /ASP.NET_SessionId/i
          return true if _first_cookie_match d, /ASPSESSIONID/i
          return true if _first_cookie_match d, /ASPXAUTH/i
          return true if _first_cookie_match d, /barra_counter_session/i
          return true if _first_cookie_match d, /cfid/i
          return true if _first_cookie_match d, /cftoken/i
          return true if _first_cookie_match d, /_enservio_session/i
          return true if _first_cookie_match d, /grafana_sess/i
          return true if _first_cookie_match d, /_gitlab_session/i
          return true if _first_cookie_match d, /jive.login.ts/i
          return true if _first_cookie_match d, /JSESSIONID/i
          return true if _first_cookie_match d, /LiSESSIONID/i
          return true if _first_cookie_match d, /MRHSession/i
          return true if _first_cookie_match d, /sails.sid/i
          return true if _first_cookie_match d, /sessid/i
          return true if _first_cookie_match d, /session/i
          return true if _first_cookie_match d, /sid/i
          return true if _first_cookie_match d, /SITESERVER/i
          return true if _first_cookie_match d, /TWIKISID/i
          return true if _first_cookie_match d, /viewstate/i
          return true if _first_cookie_match d, /zenid/i
        false
        },
        paths: [ { path: "#{url}", follow_redirects: true } ],
      },
    ]
  end
end
end
end
end
