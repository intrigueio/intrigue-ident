module Intrigue
module Ident
module Check
class Ivanti < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        type: "fingerprint",
        category: "application",
        tags: ['COTS', 'Appliance', 'Administrative', 'Admin Panel'],
        vendor: "Ivanti",
        product:"LANDESK Appliance",
        description:"matched title",
        version: nil,
        match_logic: :all,
        matches: [
          {
            match_type: :content_body,
            match_content:  /<title>LANDESK\(R\) Cloud Services Appliance/i,
          }
        ],
        references: ["https://community.ivanti.com/community/all-products/systems/cloudservices"],
        paths: [ { path: "#{url}", follow_redirects: true } ],
        inference: false,
        test_target: ["https://csa.tpchd.org/"]
      }
    ]
  end

end
end
end
end
