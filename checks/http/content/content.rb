module Intrigue
module Ident
module Check
class Content < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        :type => "content",
        :name =>"Location Header",
        :match_type => :content_header,
        :dynamic_result => lambda { |d| _first_header_capture(d,/^location:(.*)$/i) },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name =>"Directory Listing Detected",
        :match_type => :content_title,
        :dynamic_result => lambda { |d| (  
          _first_title_match(d,/Index of \//) ||
          _first_body_match(d, /<h1>Index of \//) || 
          _first_body_match(d, /\[To Parent Directory\]/) ) ? true : false },
        :dynamic_hide => lambda { |d| false },
        :issue => "directory_listing_detected",
        :paths => ["#{url}"]
      },
      #{
      #  :type => "content",
      #  :name =>"Open Redirect Detected",
      #  :match_type => :content_body,
      #  :references => [
      #    "https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/Open%20Redirect"
      #  ],
      #  :dynamic_result => lambda { |d|
      #    regex_list = [
      #    /\?next=http/i,/\?url=http/i,/\?target=http/i,/\?rurl=http/i,
      #    /\?dest=http/i,/\?destination=http/i,/\?redir=http/i,
      #    /\?redirect_uri=http/i,/\?redirect_url=http/i,/\?redirect=http/i,
      #    /\/redirect\/http/i,/\/cgi-bin\/redirect.cgi\?http/i,/\/out\/http/i,
      #    /\/out\?http/i,/\?view=http/i,/\/login\?to=http/i,/\?image_url=http/i,
      #    /\?go=http/i,/\?return=http/i,/\?returnTo=http/i,/\?return_to=http/i,
      #    /\?checkout_url=http/i,/\?continue=http/i,/\?return_path=http/i
      #    ]
      #    out = false
      #    regex_list.each { |regex|
      #      _first_body_match(d,regex) ? out = true : nil 
      #    }
      #  out
      #  },
      #  :dynamic_hide => lambda { |d| false },
      #  :dynamic_issue => lambda { |d| false   },
      #  :paths => ["#{url}"]
      #},
      {
        :type => "content",
        :name =>"Form Detected",
        :match_type => :content_body,
        :dynamic_result => lambda { |d| _first_body_match(d,/\<form/) ? true : false },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      },
      {
        :type => "content",
        :name =>"File Upload Form Detected",
        :match_type => :content_body,
        :dynamic_result => lambda { |d| _first_body_match(d,/enctype=\"multipart\/form-data/) ? true : false },
        :paths => ["#{url}"],
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
      },
      {
        :type => "content",
        :name =>"Email Addresses Detected",
        :match_type => :content_title,
        :dynamic_result => lambda { |d| 
        email_address_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
          captures = _all_body_captures(d,email_address_regex) || []
          captures.select{|e| !(e =~ /\.png$/) }.compact
        },
        :dynamic_hide => lambda { |d| false },
        :dynamic_issue => lambda { |d| false },
        :paths => ["#{url}"]
      }
    ]
  end
end
end
end
end
