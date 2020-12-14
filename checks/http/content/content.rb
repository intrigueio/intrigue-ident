module Intrigue
module Ident
module Check
class Content < Intrigue::Ident::Check::Base
  
  def generate_checks(url)
    [
      {
        :type => "content",
        :name =>"MurmurHash Page Content",
        :dynamic_result => lambda { |d| _body_raw_binary_checksum_mmh3(d) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"MurmurHash Favicon",
        :dynamic_result => lambda { |d| _body_raw_binary_checksum_mmh3(d) },
        :paths => [ { :path  => "#{url}/favicon.ico", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"Location Header",
        :dynamic_result => lambda { |d| _first_header_capture(d,/^location:(.*)$/i) },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"Directory Listing Detected",
        :dynamic_result => lambda { |d| (  
          _first_title_match(d,/Index of \//) ||
          _first_body_match(d, /<h1>Index of \//) || 
          _first_body_match(d, /\[To Parent Directory\]/) ) ? true : false },
        :issues => ["directory_listing_detected"],
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"Form Detected",
        :dynamic_result => lambda { |d| _first_body_match(d,/\<form/) ? true : false },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"File Upload Form Detected",
        :dynamic_result => lambda { |d| _first_body_match(d,/enctype=\"multipart\/form-data/) ? true : false },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      },
      {
        :type => "content",
        :name =>"Email Addresses Detected",
        :dynamic_result => lambda { |d| 
        email_address_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
          captures = _all_body_captures(d,email_address_regex) || []
          captures.select{|e| !(e =~ /\.png$/) }.compact
        },
        :paths => [ { :path  => "#{url}", :follow_redirects => true } ],
      }
    ]
  end
end
end
end
end
