module Intrigue
  module Ident
  module Check
  class ParkingCrew < Intrigue::Ident::Check::Base
  
    def generate_checks(url)
      [
        {
          type: "fingerprint",
          category: "service",
          tags: ["Parked"],
          vendor: "ParkingCrew",
          product: "ParkingCrew",
          website: "http://www.parkingcrew.net/",
          references: [],
          version: nil,
          match_logic: :any,
          matches: [
            {
              match_type: :content_body,
              match_content: /inquire\ about\ this\ domain/i,
            },
            {
              match_type: :content_body,
              match_content: /The\ Sponsored\ Listings\ displayed\ above\ are\ served\ automatically\ by\ a\ third\ party/i,
            }
          ],
          description: "ParkingCrew - Body Match",
          hide: false,
          paths: [ { path: "#{url}", follow_redirects: true } ],
          inference: false
        },
      ]
    end
  
  end
  end
  end
  end
  
