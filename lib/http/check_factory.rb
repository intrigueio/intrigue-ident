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

          # if we're not in noisy mode, filter checks that have require_* conditions
          return checks_to_return if opts[:noisy]

          checks_to_return.select do |x|
            x[:require_product].nil? && x[:require_vendor].nil? && x[:require_vendor_product].nil? && x
          end
        end

        #
        # Provide checks given a vendor
        #
        def self.generate_checks_for_vendor(url, vendor, _opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          checks_to_return.select do |x|
            x[:require_vendor] == vendor.to_s
          end
        end

        #
        # Provide checks givene a product
        #
        def self.generate_checks_for_product(url, product, _opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          checks_to_return.select do |x|
            x[:require_product] == product.to_s
          end
        end

        #
        # Provide checks givene a vendor product
        #
        def self.generate_checks_for_vendor_product(url, vendor, product, _opts = {})
          checks_to_return = @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact

          checks_to_return.select do |x|
            x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(' ', '_')
          end
        end

        def self.filter_by_tags(checks, opts)
          if opts[:checks_with_tag] && !opts[:checks_with_tag].empty?
            checks = checks.reject do |x|
              (x[:tags].nil? || x[:tags].map(&:upcase) & opts[:checks_with_tag].map(&:upcase)).empty?
            end
          end
          checks
        end

        # This function will be deleted once we have normalized the hashes. Some work around that has been done
        # on the redirect branch.
        def self.filter_by_tags_post_run_initial_results(checks, opts)
          if opts[:checks_with_tag] && !opts[:checks_with_tag].empty?
            checks = checks.reject do |x|
              if x['tags'].nil?
                true
              else
                (x['tags'].map(&:upcase) & opts[:checks_with_tag].map(&:upcase)).empty?
              end
            end
          end
          checks
        end

        def self.filter_by_tags_post_run(checks, opts)
          if opts[:checks_with_tag] && !opts[:checks_with_tag].empty?
            checks = checks.reject do |x|
              if x[:tags].nil?
                true
              else
                (x[:tags].map(&:upcase) & opts[:checks_with_tag].map(&:upcase)).empty?
              end
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
