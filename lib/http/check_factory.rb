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
        def self.generate_initial_checks(url)
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            x[:require_product].nil? && x[:require_vendor].nil? && x[:require_vendor_product].nil?
          end
        end

        #
        # Provide checks given a vendor
        #
        def self.generate_checks_for_vendor(url, vendor)
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            x[:require_vendor] == vendor.to_s
          end
        end

        #
        # Provide checks givene a product
        #
        def self.generate_checks_for_product(url, product)
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            x[:require_product] == product.to_s
          end
        end

        #
        # Provide checks givene a vendor product
        #
        def self.generate_checks_for_vendor_product(url, vendor, product)
          @checks.map { |x| x.new.generate_checks(url.to_s) }.flatten.compact.select do |x|
            x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(' ', '_')
          end
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
