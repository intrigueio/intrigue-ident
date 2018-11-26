module Intrigue
module Ident
module Check
    class Zendesk < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "service",
            :vendor =>"Zendesk",
            :product =>"Zendesk",
            :match_details =>"unique header",
            :references => [],
            :match_type => :content_headers,
            :match_content =>  /^x-zendesk-origin-server:.*$/i,
            :paths => ["#{url}"]
          },
          { # TODO - this might catch valid (closed) helpdesk uris too.
            :type => "service",
            :vendor =>"Zendesk",
            :product =>"Zendesk",
            :match_details =>"zendesk access by IP / invalid hostname",
            :references => [],
            :hide => true,
            :match_type => :content_body,
            :match_content =>  /<title>Help Center Closed \| Zendesk/i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
