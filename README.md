Ident is the an fingerprinting library, and is used within Intrigue Core. 

The Ident project has a few stated goals: 

 - To deeply identify network service ad app software while remain extremely fast by limiting necessary requests
 - To be the most complete library for modern application and server software identification 
 - To integrate well as a library, for easy use in other projects
 - To be commercially viable through use of the BSD license
 - To maintain a robust command line interface, for use as a standalone tool 

 Ident is written in Ruby and uses core Ruby (HTTP|Socket|etc) libraries to make requests. It integrates with headless Chrome for checks that require the DOM. 

 Below, find instruction on how to get stated


Using ident via Docker image:
=============================
1) Build the docker image  (optional, docker will download directly from [DockerHub](https://cloud.docker.com/u/intrigueio/repository/docker/intrigueio/intrigue-ident) if the image doesnt exist locally)
  `$ docker build . -t intrigueio/intrigue-ident`

2) Run the command line tool via docker 
`$ docker run -it intrigueio/ident util/ident.rb -u https://intrigue.io`


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

Contributors:
=============

A special thanks to the following contributors who help make ident awesome!
 - @bcoles: Checks, bugfixes
 - @bmcdevitt: Checks
 - @retornam: Dockerization