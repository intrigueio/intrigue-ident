Ident is the app fingerprinting library used within Intrigue Core. 

It uses Headless Chrome and Selenium to drive a browser, as well as core Ruby libraries to make requests. Identification should take around 10 seconds if using browser checks, faster if not.

Getting started on OSX:
==================
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

![Ident Usage](https://monosnap.com/image/RN9uag2d5la5AnVB972pupvkSuBmMm.png)

```
jcran ident master [20190517]$ bundle exec ./util/check.rb -u https://intrigue.io -b
Checking... https://intrigue.io
Fingerprint:
 - Auth0 Auth0   - Auth0 link (CPE: cpe:2.3:s:auth0:auth0::) (Tags: ["IAM"])
 - Varnish-Cache Varnish 1.1  - Varnish Proxy (CPE: cpe:2.3:a:varnish-cache:varnish:1.1:) (Tags: ["Web Server", "Cache"])
 - Cloudflare Cloudflare   - Cloudflare Accelerated Page (CPE: cpe:2.3:s:cloudflare:cloudflare::) (Tags: ["CDN", "WAF"])
 - Webflow Webflow   - body string (CPE: cpe:2.3:s:webflow:webflow::) (Tags: ["Web Framework", "Javascript"])
Content Checks:
 - Authentication - HTTP: false
 - Authentication - Forms: false
 - Google Analytics Account Detected: false
 - Location Header: 
 - Directory Listing Detected: false
 - Form Detected: true
 - File Upload Form Detected: false
 - Email Addresses Detected: []
 - Access-Control-Allow-Origin Header: false
 - P3P Header: false
 - X-Frame-Options Header: false
 - X-XSS-Protection Header: false
```


Troubleshooting:
================

If you hit something like the following: ```Selenium::WebDriver::Error::SessionNotCreatedError: session not created: Chrome version must be between 70 and 73
  (Driver info: chromedriver=73.0.3683.68 (47787ec04b6e38e22703e856e101e840b65afe72),platform=Mac OS X 10.14.1 x86_64)
  /Users/jcran/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/selenium-webdriver-3.142.2/lib/selenium/webdriver/remote/response.rb:72:in `assert_ok'
```

It's likely that you need to update chromedriver. Do that by running the command: ```$ brew cask reinstall chromedriver```