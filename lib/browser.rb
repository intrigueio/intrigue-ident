# This module exists for common web functionality - inside a web browser
module Intrigue
module Ident
  module Browser

    def ident_create_browser_session
      # Start a new session
      Capybara::Session.new(:headless_chrome)
    end

    def ident_destroy_browser_session(session)
      #session.visit('about:blank')

      # get the full group id (driver + browser)
      begin

        # HACK HACK HACK- get the chromedriver process before we quit
        driver_pid = session.driver.browser.instance_variable_get(:@service).instance_variable_get(:@process).pid

        # attempt to quit gracefully...
        session.driver.quit

        pgid = Process.getpgid(driver_pid)

        # violent delights have violent ends
        Process.kill('KILL', -pgid )
        Process.kill('KILL', driver_pid )

      rescue Errno::ESRCH => e
        # already dead
        puts "Error trying to kill our browser session #{e}"
      rescue Net::ReadTimeout => e
        puts "Timed out trying to close our session.. #{e}"
      end

    end

    def ident_safe_browser_action
      begin
        results = yield
      rescue Addressable::URI::InvalidURIError => e
        puts "Unable to visit..."
      rescue Capybara::ElementNotFound => e
        puts "Element not found: #{e}"
      rescue Net::ReadTimeout => e
        puts "Timed out, moving on"
      rescue Selenium::WebDriver::Error::WebDriverError => e
        # skip simple errors where we're testing JS libs
        unless ("#{e}" =~ /is not defined/ || "#{e}" =~ /Cannot read property/)
          puts "Webdriver issue #{e}"
        end
      rescue Selenium::WebDriver::Error::NoSuchWindowError => e
        puts "Lost our window #{e}"
      rescue Selenium::WebDriver::Error::UnknownError => e
        # skip simple errors where we're testing JS libs
        unless ("#{e}" =~ /is not defined/ || "#{e}" =~ /Cannot read property/)
          puts "#{e}"
        end
      rescue Selenium::WebDriver::Error::UnhandledAlertError => e
        puts "Unhandled alert open: #{e}"
      rescue Selenium::WebDriver::Error::NoSuchElementError
        puts "No such element #{e}, moving on"
      rescue Selenium::WebDriver::Error::StaleElementReferenceError
        puts "No such element ref #{e}, moving on"
      end
    results
    end

    def ident_capture_document(session, uri)
      # browse to our target
      ident_safe_browser_action do
        session.visit(uri)
      end

      # Capture Title
      page_title = session.document.title
      # Capture Body Text
      page_contents = session.document.text(:all)
      # Capture DOM
      rendered_page = nil
      ident_safe_browser_action do
        rendered_page = session.evaluate_script("document.documentElement.innerHTML",[])
      end

    { :title => page_title, :contents => page_contents, :rendered => rendered_page }
  end

  def ident_capture_screenshot(session, uri)

    # browse to our target
    ident_safe_browser_action do
      session.visit(uri)
    end

    # wait for the page to render
    #sleep 5

    #
    # Capture a screenshot
    #
    tempfile = Tempfile.new(['screenshot', '.png'])

    ident_safe_browser_action do
      session.save_screenshot(tempfile.path)
      _log "Saved Screenshot to #{tempfile.path}"
    end

    # open and read the file's contents, and base64 encode them
    base64_image_contents = Base64.encode64(File.read(tempfile.path))

    # cleanup
    tempfile.close
    tempfile.unlink

  base64_image_contents
  end

  def ident_gather_javascript_libraries(session, uri)

    # Test site: https://www.jetblue.com/plan-a-trip/#/
    # Examples: https://builtwith.angularjs.org/
    # Examples: https://www.madewithangular.com/

    ident_safe_browser_action do
      session.visit(uri)
    end

    libraries = []

    checks = [
      { library: "Angular", script: 'angular.version.full' },
      # Backbone
      # Test site: https://app.casefriend.com/
      # Examples: https://github.com/jashkenas/backbone/wiki/projects-and-companies-using-backbone
      { library: "Backbone", script: 'Backbone.VERSION' },
      # D3
      # Test site: https://d3js.org/
      # Examples: https://kartoweb.itc.nl/kobben/D3tests/index.html
      { library: "D3", script: 'd3.version' },
      # Dojo
      # Test site: http://demos.dojotoolkit.org/demos/mobileCharting/demo.html
      # Examples: http://demos.dojotoolkit.org/demos/
      { library: "Dojo", script: 'dojo.version' },
      # Ember
      # Test site: https://secure.ally.com/
      # Examples: http://builtwithember.io/
      { library: "Ember", script: 'Ember.VERSION' },

      # Honeybadger
      { library: "Honeybadger", script: 'Honeybadger.getVersion()' },

      # Intercom
      # Examples: https://bugcrowd.com
      { library: "Intercom", script: 'Intercom("version")' },

      # Jquery
      # Test site: http://www.eddiebauer.com/
      # Test site: https://www.underarmour.com
      { library: "jQuery", script: 'jQuery.fn.jquery' },
      # Jquery tools
      # Test site: http://www.eddiebauer.com/
      { library: "jQuery Tools", script: 'jQuery.tools.version' },
      # Jquery UI
      # Test site: http://www.eddiebauer.com/
      # Test site: https://www.underarmour.com
      { library: "jQuery UI", script: 'jQuery.ui.version' },

      # Test site:
      # Examples: http://knockoutjs.com/examples/
      #version = session.evaluate_script('knockout.version')
      # { :product => "Knockout", check: 'knockout.version' }

      # Modernizr
      { library: "Modernizr", script: 'Modernizr._version' },

      # Paper.js
      # Test site: http://paperjs.org/examples/boolean-operations
      # Examples: http://paperjs.org/examples

      # Prototype
      # Test site:
      # Examples:
      # version = session.evaluate_script('Prototype.version')
      # { product: "Prototype", check: 'Prototype.version' },

      { library: "Paper", script: 'paper.version' },

      # React
      # Test site: https://weather.com/
      # Examples: https://react.rocks/
      { library: "React", script: 'React.version' },

      # RequireJS
      # Test site: https://www.homedepot.com
      { library: "RequireJS", script: 'requirejs.version' },

      # Underscore
      # Test site: https://app.casefriend.com/#sessions/login
      # Test site: https://store.dji.com/
      { library: "Underscore", script: '_.VERSION' },

      # YUI
      # Test site: https://yuilibrary.com/yui/docs/event/basic-example.html
      # Examples: https://yuilibrary.com/yui/docs/examples/
      { library: "YUI", script: 'YUI().version' }
    ]

    checks.each do |check|

      hacky_javascript = "#{check[:script]};"

      # run our script in a browser
      version = ident_safe_browser_action do
        session.evaluate_script(hacky_javascript, check[:arguments] || [])
      end

      if version
        _log_good "Detected #{check[:library]} #{version}"
        libraries << {"library" => "#{check[:library]}", "version" => "#{version}" }
      end

    end

  libraries
  end


  end
end
end
