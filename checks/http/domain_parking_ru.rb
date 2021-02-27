module Intrigue
  module Ident
  module Check
  class DomainParkingRu < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "DomainParking.ru",
          product: "DomainParking.ru",
          website: "https://domainparking.ru/",
          references: [],
          version: nil,
          match_type: :content_body,
          match_content: /Domain is parked by service DomainParking.ru/i,
          description: "unique string in body",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        }
      ]
    end
  
  end
  end
  end
  end
  