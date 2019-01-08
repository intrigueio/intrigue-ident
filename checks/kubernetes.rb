module Intrigue
module Ident
module Check
    class Kubernetes < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Orchestration", "Networking"],
            :vendor => "Kubernetes",
            :product =>"Kubernetes",
            :match_details =>"Audit-id header",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /Audit-Id: [a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89aAbB][a-f0-9]{3}-[a-f0-9]{12}/,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Orchestration", "Networking"],
            :vendor => "Kubernetes",
            :product =>"Kubernetes",
            :match_details =>"json (auth'd) response",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /groupVersion":"apiregistration.k8s.io\/v1beta1/,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Orchestration", "Networking"],
            :vendor => "Kubernetes",
            :product =>"Kubernetes",
            :match_details =>"json (unauth'd) response",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /forbidden: User \\"system:anonymous\\" cannot get path/,
            :paths => ["#{url}"]
          },
        ]
      end

    end
  end
  end
  end
