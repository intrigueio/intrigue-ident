Ident is the app fingerprinting library used within Intrigue Core. It uses Headless Chrome and Selenium to drive a browser, as well as core Ruby libraries to make requests. Identification should take around 10 seconds if using browser checks, faster if not.

Getting started on OSX:
=======================
1) [Install brew](https://brew.sh/) (if you don't already have it)

2)  Then install chromedriver via a brew cask: https://www.kenst.com/2015/03/installing-chromedriver-on-mac-osx/: 

```
$ brew cask install chromedriver
```

2.1) Alias chrome so it can be started via chromedriver (unsure if this is needed)

```
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
```

3) Install ruby [preferrably using rbenv](https://github.com/rbenv/rbenv#installation)

4) Install bundler ```gem install bundler```

5) Clone the ident repository ```git clone https://github.com/intrigueio/intrigue-ident.git```

6) Install the ident gem dependencies

```bundle install```

7) Now use the check utility to test!

![Ident Usage](https://api.monosnap.com/file/download?id=FRqxPx7aE3EdQMcpZ9A7YvxskvvuBo)

```
$ bundle exec ./util/ident.rb -v -u https://xyz.com:443
Checking... https://xyz.com:443
Fingerprint:
 - PHP PHP 5.4.16  - x-powered-by header (CPE: cpe:2.3:a:php:php:5.4.16:) (Tags: ["Web Framework"])
   - Vuln: CVE-2016-5768 (CVSSv3: 9.8)
   - Vuln: CVE-2016-5773 (CVSSv3: 9.8)
   - Vuln: CVE-2015-8835 (CVSSv3: 9.8)
   - Vuln: CVE-2016-4541 (CVSSv3: 9.8)
   - Vuln: CVE-2016-4538 (CVSSv3: 9.8)
 - PHP PHP   - PHPSESSID cookie (CPE: cpe:2.3:a:php:php::) (Tags: ["Web Framework"])
 - Apache HTTP Server 2.4.6  - Apache web server - server header - with versions (CPE: cpe:2.3:a:apache:http_server:2.4.6:) (Tags: ["Web Server"])
   - Vuln: CVE-2018-1312 (CVSSv3: 9.8)
   - Vuln: CVE-2017-7679 (CVSSv3: 9.8)
   - Vuln: CVE-2017-9788 (CVSSv3: 9.1)
   - Vuln: CVE-2016-5387 (CVSSv3: 8.1)
   - Vuln: CVE-2017-15715 (CVSSv3: 8.1)
 - Wordpress Wordpress   - common link (CPE: cpe:2.3:a:wordpress:wordpress::) (Tags: ["CMS"])
 - Yoast Wordpress SEO   - unique string (CPE: cpe:2.3:a:yoast:wordpress_seo::) (Tags: ["Marketing", "Wordpress Plugin"])
 - Bootstrap Bootstrap   - boostrap css (CPE: cpe:2.3:a:bootstrap:bootstrap::) (Tags: ["Web Framework"])
 - OpenSSL OpenSSL 1.0.2k-fips  - server header (CPE: cpe:2.3:a:openssl:openssl:1.0.2k-fips:) (Tags: ["Library"])
   - Vuln: CVE-2018-0732 (CVSSv3: 7.5)
   - Vuln: CVE-2018-0739 (CVSSv3: 6.5)
   - Vuln: CVE-2017-3736 (CVSSv3: 6.5)
   - Vuln: CVE-2017-3737 (CVSSv3: 5.9)
   - Vuln: CVE-2017-3738 (CVSSv3: 5.9)
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
 - @bcoles: Checks, Bugfixes
 - @bmcdevitt: Checks
 - @retornam: Dockerization
 


Troubleshooting:
================

If you hit something like the following: 
```Selenium::WebDriver::Error::SessionNotCreatedError: session not created: Chrome version must be between 70 and 73
  (Driver info: chromedriver=73.0.3683.68 (47787ec04b6e38e22703e856e101e840b65afe72),platform=Mac OS X 10.14.1 x86_64)
  /Users/jcran/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.142.2/lib/selenium/webdriver/remote/response.rb:72:in `assert_ok'
 ```

It's likely that you need to update chromedriver. Do that by running the command: 
```$ brew cask reinstall chromedriver```
