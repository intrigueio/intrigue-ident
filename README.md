Ident is an application and service fingerprinting library used within Intrigue Core. 

The Ident project has a few stated goals: 
 - To deeply identify network service and app software while remain extremely fast - limiting unnecessary requests
 - To have the most complete set of identification checks for modern application and server software identification 
 - To integrate well as a library, for easy use in other projects
 - To maintain a robust command line interface for use as a standalone tool 
 - To remain commercially viable through use of the BSD license

 Ident is written in Ruby and uses core Ruby (HTTP|Socket|etc) libraries to make requests. 

 Below, find instruction on how to get stated:

Using ident via Docker image:
=============================
1) Pull and run the docker image! It'll download directly from [DockerHub](https://cloud.docker.com/u/intrigueio/repository/docker/intrigueio/intrigue-ident) if the image doesnt exist locally
  `docker pull intrigueio/intrigue-ident && docker run -t intrigueio/intrigue-ident --url https://intrigue.io`

Installing directly on OSX:
===========================
1) [Install brew](https://brew.sh/) (if you don't already have it)
2) Install ruby [preferrably using rbenv](https://github.com/rbenv/rbenv#installation)
3) Install bundler `gem install bundler`
4) Clone the ident repository `git clone https://github.com/intrigueio/intrigue-ident.git`
5) Install the ident gem dependencies `bundle install`
6) Now use the check utility to test. Example below:
```
$ bundle exec ruby ./util/ident.rb -v -u https://xyz.com:443
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
```
HTTP Check types are in the following categories. See each check's 'match_content': 
 - content_body: checks should be run against body
 - content_headers: checks should be run against response headers (assumes one string of text, each header '\n' delimited)
 - content_title: checks should be run against text inside the <title> tag (do not include the tag when writing checks)
 - content_generator:  checks should be run against text inside the <meta generator> tag (do not include the tag when writing checks)
 - content_cookies; checks should be run against the set-cookie: header (do not include the header name, just the content when writing checks)
 ```


Contributors:
=============

A special thanks to the following contributors who help make ident awesome!
 - @duartemateus: Checks!
 - @jen140: Checks
 - @bensalah_anas: Checks
 - @bcoles: Checks, bugfixes, JSON output
 - @bmcdevitt: Checks
 - @retornam: Dockerization
