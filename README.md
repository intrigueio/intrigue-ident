Ident is an application and service fingerprinting library used within Intrigue Core. 

The Ident project has a few stated goals: 
 - To deeply identify network service and app software while remaining extremely fast - limiting unnecessary requests
 - To have the most complete set of identification checks for modern application and server software
 - To integrate well as a library, for easy use in other projects such as Intrigue Core
 - To maintain a robust command line interface for use as a standalone tool 
 - To be commercially viable through use of the BSD license

 Ident is written in Ruby and uses the lightning fast libcurl-backed Typhoeus and the powerful Socketry libraries to make requests. 

 Below, find instruction on how to get stated:

Using ident via Docker image:
=============================
1) Pull and run the docker image! It'll download directly from [DockerHub](https://cloud.docker.com/u/intrigueio/repository/docker/intrigueio/intrigue-ident) if the image doesnt exist locally
  `docker run -t intrigueio/intrigue-ident -u https://intrigue.io`

Usage:
======
```
$ bundle exec ruby ./util/ident.rb -c -v -u https://xyz.com:443
Checking... https://xyz.com:443
Fingerprint:
 - PHP PHP 5.4.16  - x-powered-by header (CPE: cpe:2.3:a:php:php:5.4.16:) (Tags: ["Web Framework"])
   - Vuln: CVE-2016-5768 (CVSSv3: 9.8)
   - Vuln: CVE-2016-4538 (CVSSv3: 9.8)
 - PHP PHP   - PHPSESSID cookie (CPE: cpe:2.3:a:php:php::) (Tags: ["Web Framework"])
 - Apache HTTP Server 2.4.6  - Apache web server - server header - with versions (CPE: cpe:2.3:a:apache:http_server:2.4.6:) (Tags: ["Web Server"])
   - Vuln: CVE-2018-1312 (CVSSv3: 9.8)
   - Vuln: CVE-2017-15715 (CVSSv3: 8.1)
 - Wordpress Wordpress   - common link (CPE: cpe:2.3:a:wordpress:wordpress::) (Tags: ["CMS"])
 - Yoast Wordpress SEO   - unique string (CPE: cpe:2.3:a:yoast:wordpress_seo::) (Tags: ["Marketing", "Wordpress Plugin"])
 - Bootstrap Bootstrap   - boostrap css (CPE: cpe:2.3:a:bootstrap:bootstrap::) (Tags: ["Web Framework"])
 - OpenSSL OpenSSL 1.0.2k-fips  - server header (CPE: cpe:2.3:a:openssl:openssl:1.0.2k-fips:) (Tags: ["Library"])
   - Vuln: CVE-2018-0732 (CVSSv3: 7.5)
Content Checks:
 - Authentication - HTTP: false
 - Authentication - Session Identifier: true
 - Google Analytics Account Detected: false
 - Location Header: 
 - Directory Listing Detected: false
 - Form Detected: false
 - File Upload Form Detected: false
 - Email Addresses Detected: []
 - Access-Control-Allow-Origin Header: false
 - P3P Header: false
 - X-Frame-Options Header: true
 - X-XSS-Protection Header: false
```

For Check Writers: 
===================

Check types can be written against supported protocols: 
 - Amqp 
 - Dns
 - Elasticsearch
 - Ftp
 - Http/Https
 - Mongodb 
 - Mysql
 - Pop3
 - Redis
 - Smtp
 - Snmp
 - Ssh
 - Telnet

Generally speaking, checks have the following structure. This is a check for HTTP and HTTPS: 
```
 [
        {
          type: "fingerprint",
          category: "service",
          vendor: "Some",
          product: "Product",
          website: "https://www.somewhere.co.uk/",
          match_logic: :all,
          matches: [
            {
              match_type: :content_title,
              match_content: /The Title of the Page/i
            },
            {
              match_type: :content_body,
              match_content: /any body string/i
            }, 
            {
              match_type: :content_code,
              match_content: 200
            }  
          ],
          description: "just an example check",
          paths: [ { path: "#{url}", follow_redirects: true } ]
        }
      ]
```
 
There are many types of matchers, which tell the check what part of the target's response to check.  
```
 - content_body: checks should be run against body
 - content_code: checks should be run against code returned in the response as an integer (note that this is generally only useful for follow-on checks)
 - content_cookies: checks should be run against the set-cookie: header (do not include the header name, just the content when writing checks)
 - content_generator:  checks should be run against text inside the <meta generator> tag (do not include the tag when writing checks)
 - content_headers: checks should be run against response headers (assumes one string of text, each header '\n' delimited)
 - content_title: checks should be run against text inside the <title> tag (do not include the tag when writing checks)
 ```

Multiple matches per check are supported, see: https://github.com/intrigueio/intrigue-ident/pull/87

For more details, have a look at the checks in the 'checks' directory, or jump into our slack channel for help. 
 
Contributors:
=============

A special thanks to the following contributors who help make ident awesome!
 - @duartemateus: Protocol support and fingerprints
 - @chowdud: Fingerprints++ ** 
 - @jen140: Fingerprints
 - @shpendk: Fingerprints, Architecture
 - @m-q-t: Fingerprints, Architecture 
 - @bensalah_anas: Fingerprints
 - @bcoles: Fingerprints, Bugfixes, JSON output
 - @bmcdevitt: Fingerprints
 - @retornam: Dockerization
