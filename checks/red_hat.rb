module Intrigue
module Ident
module Check
    class RedHat < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Development", "Administrative", "Hypervisor"],
            :vendor =>"Red Hat",
            :product =>"OpenShift Container Platform",
            :match_details =>"error message in html",
            :references => ["https://bugzilla.redhat.com/show_bug.cgi?id=1414657"],
            :match_type => :content_body,
            :match_content =>  /Route and path matches, but all pods are down./i,
            :paths => ["#{url}"]
          }
        ]
      end

    end
  end
  end
  end
