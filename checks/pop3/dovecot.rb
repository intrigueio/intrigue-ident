module Intrigue
module Ident
module Pop3Check
class Dovecot < Intrigue::Ident::Pop3Check::Base
  def generate_checks
    [
      {
        :type => "fingerprint",
        :category => "application",
        :tags => ["Pop3 Server"],
        :vendor => "Dovecot",
        :product => "Dovecot",
        :references => ["https://security.stackexchange.com/questions/192137/risks-in-open-pop3-imap-ports"],
        :version => nil,
        :match_type => :content_banner,
        :match_content => /Fenix ready\./i,
        :match_details => "banner",
        :hide => false,
        :inference => false
      }
    ]
  end
end
end
end
end
