module Intrigue
module Ident
module Check
class Kubernetes < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ["Orchestration", "Networking"],
        vendor: "Kubernetes",
        product:"Kubernetes",
        description:"default backend - 404",
        version: nil,
        match_type: :content_body,
        match_content:  /^default backend - 404$/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      #{
      #  type: "fingerprint",
      #  category: "application",
      #  tags: ["Orchestration", "Networking"],
      #  vendor: "Kubernetes",
      #  product:"Kubernetes",
      #  description:"certificate",
      #  version: nil,
      #  match_type: :content_cert_issuer,
      #  match_content:  /^\/O=Acme Co\/CN=Kubernetes Ingress Controller Fake Certificate$/,
      #  paths: [ { path: "#{url}", follow_redirects: true } ],
      #  inference: false
      #},
      {
        type: "fingerprint",
        category: "application",
        tags: ["Orchestration", "Networking"],
        vendor: "Kubernetes",
        product:"Kubernetes",
        description:"Audit-id header",
        version: nil,
        match_type: :content_headers,
        match_content:  /Audit-Id: [a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89aAbB][a-f0-9]{3}-[a-f0-9]{12}/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Orchestration", "Networking"],
        vendor: "Kubernetes",
        product:"Kubernetes",
        description:"json (auth'd) response",
        version: nil,
        match_type: :content_body,
        match_content:  /groupVersion":"apiregistration.k8s.io\/v1beta1/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Orchestration", "Networking"],
        vendor: "Kubernetes",
        product:"Kubernetes",
        description:"json (unauth'd) response",
        version: nil,
        match_type: :content_body,
        match_content:  /forbidden: User \\"system:anonymous\\" cannot get path/,
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false
      },
      {
        type: "fingerprint",
        category: "application",
        tags: ["Orchestration", "Networking"],
        vendor: "Kubernetes",
        product:"Kubernetes",
        description:"api page string",
        version: nil,
        match_type: :content_body,
        match_content:  /serverAddressByClientCIDRs/,
        paths: [{ path: "#{url}/api", follow_redirects: true } ],
        inference: false
      }
    ]
  end

end
end
end
end
