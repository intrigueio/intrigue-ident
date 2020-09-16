module Intrigue
module Ident
module Check
class Zendesk < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS","Support"],
        :vendor =>"Zendesk",
        :product =>"Zendesk",
        :match_details =>"unique header",
        :references => [],
        :match_type => :content_headers,
        :match_content =>  /^x-zendesk-origin-server:.*$/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      },
      { # TODO - this might catch valid (closed) helpdesk uris too.
        :type => "fingerprint",
        :category => "service",
        :tags => ["SaaS","Support"],
        :vendor =>"Zendesk",
        :product =>"Zendesk",
        :match_details =>"zendesk access by IP / invalid hostname",
        :references => [],
        :hide => true,
        :match_type => :content_body,
        :match_content =>  /<title>Help Center Closed \| Zendesk/i,
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
        :inference => false
      }
    ]
  end

end
end
end
end
