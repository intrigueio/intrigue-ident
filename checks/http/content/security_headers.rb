module Intrigue
module Ident
module Check
class SecurityHeaders < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        :type => "content",
        :name => "Access-Control-Allow-Origin Header",
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^Access-Control-Allow-Origin:.*/i;
        false
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name => "P3P Header",
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^p3p:.*/i;
        false
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      #{
      #  :type => "content",
      #  :name => "X-PJAX Header",
      #  :match_type => :content_headers,
      #  :dynamic_result => lambda { |d| _first_header_capture d, /^x-pjax-url:(.*)/i },
      #  :dynamic_hide => lambda { |d| false },
      #  :dynamic_issue => lambda { |d| false },
      #  :paths => ["#{url}"]
      #},
      {
        :type => "content",
        :name => "X-Frame-Options Header",
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-frame-options:.*/i;
        false
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name => "X-XSS-Protection Header",
        :dynamic_result => lambda { |d|
          return true if _first_header_match d, /^x-xss-protection:.*/i;
        false
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      }
    ]
  end
end
end
end
end
