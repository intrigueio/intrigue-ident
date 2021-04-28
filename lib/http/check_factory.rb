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
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            include_tags = compare_opts_with_tags(opts[:filter_by_tags], x[:tags])

            (x[:require_product].nil? && x[:require_vendor].nil? && x[:require_vendor_product].nil? && x || opts[:noisy]) && include_tags
          end
        end

        #
        # Provide checks given a vendor
        #
        def self.generate_checks_for_vendor(url, vendor, opts = {})
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            include_tags = compare_opts_with_tags(opts[:filter_by_tags], x[:tags])

            (x[:require_vendor] == vendor.to_s || opts[:noisy]) && include_tags
          end
        end

        #
        # Provide checks givene a product
        #
        def self.generate_checks_for_product(url, product, opts = {})
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            include_tags = compare_opts_with_tags(opts[:filter_by_tags], x[:tags])

            (x[:require_product] == product.to_s || opts[:noisy]) && include_tags
          end
        end

        #
        # Provide checks givene a vendor product
        #
        def self.generate_checks_for_vendor_product(url, vendor, product, opts = {})
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            include_tags = compare_opts_with_tags(opts[:filter_by_tags], x[:tags])

            (x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(' ',
                                                                                '_') || opts[:noisy]) && include_tags
          end
        end

        def self.compare_opts_with_tags(opts, tags)
          comparison = []
          comparison = tags.map(&:upcase) unless tags.nil?

          opts.empty? || !(opts.map(&:upcase) & comparison).empty?
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
