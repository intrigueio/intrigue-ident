module Intrigue
  module Ident
    module Http
      class CheckFactory
        #
        # Register a new handler
        #
        def self.register(klass)
          @checks ||= []
          @checks << klass if klass
        end

        #
        # Provide the full list of checks
        #
        class << self
          attr_reader :checks
        end

        #
        # Provide the full list of checks
        #
        def self.generate_initial_checks(url, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          # if we're not in noisy mode, filter checks that have require_* conditions
          unless opts[:noisy]
            checks_to_return = checks_to_return.select do |x|
              x[:require_product].nil? && x[:require_vendor].nil? && x[:require_vendor_product].nil? && x
            end
          end

          checks_to_return
        end

        #
        # Provide checks given a vendor
        #
        def self.generate_checks_for_vendor(url, vendor, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_vendor] == vendor.to_s
          end
        end

        #
        # Provide checks givene a product
        #
        def self.generate_checks_for_product(url, product, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_product] == product.to_s
          end
        end

        #
        # Provide checks givene a vendor product
        #
        def self.generate_checks_for_vendor_product(url, vendor, product, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(' ', '_')
          end
        end

        def self.filter_by_tags(checks, opts)
          if opts[:checks_with_tag] && !opts[:checks_with_tag].empty?
            checks = checks.reject { |x| x[:tags].nil? }
            checks = checks.reject do |x|
              (x[:tags].map(&:upcase) & opts[:checks_with_tag].map(&:upcase)).empty?
            end
          end
          checks
        end

        #
        # Provide the full list of checks
        #
        def self.configuration_checks
          @checks.map { |x| x.new.generate_checks('') }.flatten.compact.select { |x| x[:type] == 'content' }
        end
      end
    end
  end
end
