module Intrigue
module Ident
module Check
    class ProgressCMS < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["CMS"],
            :vendor => "Progress",
            :product => "Sitefinity",
            :references => ["https://www.progress.com/sitefinity-cms"],
            :version => nil,
            :match_type => :content_body,
            :match_content => /sitefinity (.\d*.\d*.\d*.\d*)/i,
            :dynamic_version => lambda { |x| _first_body_capture(x, /sitefinity (.\d*.\d*.\d*.\d*)/i)},
            :match_details => "header match",
            :hide => false,
            :paths => ["#{url}"],
            :inference => true
          }
        ]
      end

    end
  end
  end
  end
