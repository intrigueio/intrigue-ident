module Intrigue
module Ident
module Check
class Amazon < Intrigue::Ident::Check::Base

  def generate_checks(url)
    [
      {
        :type => "service",
        :vendor => "Amazon",
        :product =>"Cloudfront",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /via:.*.cloudfront.net \(CloudFront\)/,
        :match_details =>"cloudfront cache header",
        :hide => false,
        :paths => ["#{url}"]
      },
      {
        :type => "service",
        :vendor => "Amazon",
        :product =>"Cloudfront",
        :match_details =>"Cloudfront - no configured hostname error condition",
        :version => nil,
        :match_type => :content_body,
        :match_content => /ERROR: The request could not be satisfied/,
        :hide => true,
        :paths => ["#{url}"]
      },
      {
        :type => "service",
        :vendor => "Amazon",
        :product =>"Cloudfront",
        :match_details =>"Cloudfront - no configured hostname error condition",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /Error from cloudfront/,
        :hide => true,
        :paths => ["#{url}"]
      },
      {
        :type => "service",
        :vendor => "Amazon",
        :product =>"Cloudfront",
        :match_details =>"Cloudfront - 403 error condition",
        :version => nil,
        :match_type => :content_body,
        :match_content => /<h1>403 Forbidden<\/h1><\/center>\n<hr><center>cloudflare/,
        :hide => true,
        :paths => ["#{url}"]
      },
      {
        :tags => ["error_page","hosting_provider"],
        :type => "service",
        :url => "https://aws.amazon.com/elasticloadbalancing/",
        :vendor => "Amazon",
        :product => "Elastic Load Balancer",
        :version => nil,
        :match_type => :content_headers,
        :match_content =>  /awselb\/\d.\d/,
        :match_details =>"Amazon Elastic Load Balancer",
        :hide => true,
        :dynamic_version => lambda { |x| _first_header_capture(x,/awselb\/(\d.\d)/) },
        :paths => ["#{url}"]
      },
      {
        :type => "service",
        :vendor => "Amazon",
        :product =>"S3",
        :match_details =>"server header",
        :version => nil,
        :match_type => :content_headers,
        :match_content => /server: AmazonS3/,
        :hide => false,
        :paths => ["#{url}"]
      },
    ]
  end
end
end
end
end
