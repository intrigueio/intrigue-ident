Ident is the app fingerprinting library used within Intrigue Core. 

It uses Headless Chrome and Selenium to drive a browser, as well as core Ruby libraries to make requests. Identification should take around 10 seconds if using browser checks, faster if not.

Getting started on OSX:
==================
[Install brew](https://brew.sh/) (if you don't already have it)

Then install chromedriver

```brew install chromedriver```

Alias chrome so it can be started via chromedriver (unsure if this is needed)

```
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
```

Install ruby [preferrably using rbenv](https://github.com/rbenv/rbenv#installation)

Install bundler ```gem install bundler```

clone the ident repository ```git clone https://github.com/intrigueio/intrigue-ident.git```

Install the ident gem dependencies

```bundle install```

Now use the check utility to test!

```./util/check.rb http://site.com```
