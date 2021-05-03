module Intrigue
  module Ident
    module CheckFactory
      class BaseCheckFactory
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
        def self.checks
          @checks || []
        end

        #
        # Provide the full list of checks
        #
        class << self
          attr_reader :checks
        end

        def self.build_check_list(initial_results, opts)
          followon_checks = []

          detected_products = initial_results.map { |x| x['product'] }.uniq

          detected_products.each do |prod|
            followon_checks.concat(generate_checks_for_product(prod, opts))
          end

          ### Add checks for vendors
          detected_products = initial_results.map { |x| x['vendor'] }.uniq
          detected_products.each do |vendor|
            followon_checks.concat(generate_checks_for_vendor(vendor, opts))
          end

          ### Okay so, now we have a set of detected products, let's figure out our follown checks by vendor_product
          detected_vendor_products = initial_results.map { |x| [x['vendor'], x['product']] }.uniq
          detected_vendor_products.each do |vendor, product|
            followon_checks.concat(generate_checks_for_vendor_product(vendor, product, opts))
          end
          followon_checks
        end

        def self.generate_initial_checks(opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks }.flatten.compact

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
        def self.generate_checks_for_vendor(vendor, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_vendor] == vendor.to_s
          end
        end

        #
        # Provide checks givene a product
        #
        def self.generate_checks_for_product(product, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_product] == product.to_s
          end
        end

        #
        # Provide checks givene a vendor product
        #
        def self.generate_checks_for_vendor_product(vendor, product, opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks }.flatten.compact

          # if tags were provided, filter by them
          checks_to_return = filter_by_tags(checks_to_return, opts)

          checks_to_return.select do |x|
            x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(' ', '_')
          end
        end

        def self.filter_by_tags(checks, opts)
          unless opts[:filter_by_tags].empty?
            checks = checks.reject { |x| x[:tags].nil? }
            checks = checks.reject do |x|
              (x[:tags].map(&:upcase) & opts[:filter_by_tags].map(&:upcase)).empty?
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
