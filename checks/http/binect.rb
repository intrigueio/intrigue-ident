module Intrigue
  module Ident
    module Check
      module Private
        class Binect < Intrigue::Ident::Check::Base
          def generate_checks(url)
            [
              {
                :type => "fingerprint",
                :category => "application",
                :tags => ["CMS"],
                :vendor => "Binect",
                :product => "Online",
                :website => "https://www.binect.de/produkte/binect-online.html",
                :match_details => "Binect Online - server header",
                :version => nil,
                :match_type => :content_headers,
                :match_content => /^server: Binect Online/i,
                :dynamic_version => lambda { |x|
                  version = _first_header_capture(x, /^server: Binect Online (\d+(\.\d+)*)$/i)
                },
                :paths => [{ :path => "#{url}", :follow_redirects => true }],
                :inference => false,
                :test_target => ["http://80.158.41.151:80"],
              },
            ]
          end
        end
      end
    end
  end
end
