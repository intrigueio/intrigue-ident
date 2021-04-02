module Intrigue
module Ident
module Http
class CheckFactory

  #
  # Register a new handler
  #
  def self.register(klass)
    @checks = [] unless @checks
    @checks << klass if klass
  end

  #
  # Provide the full list of checks
  #
  def self.checks
    @checks
  end

  #
  # Provide the full list of checks
  #
  def self.generate_initial_checks(url)
    @checks.map{ |x| x.new.generate_checks("#{url}") }.flatten.compact.select{|x|
      x[:require_product] == nil && x[:require_vendor] == nil && x[:require_vendor_product] == nil }
  end

  #
  # Provide checks given a vendor
  #
  def self.generate_checks_for_vendor(url,vendor)
    @checks.map{ |x| x.new.generate_checks("#{url}") }.flatten.compact.select{|x|
      x[:require_vendor] == "#{vendor}" }
  end

  #
  # Provide checks givene a product
  #
  def self.generate_checks_for_product(url,product)
    @checks.map{ |x| x.new.generate_checks("#{url}") }.flatten.compact.select{|x|
      x[:require_product] == "#{product}" }
  end


  #
  # Provide checks givene a vendor product
  #
  def self.generate_checks_for_vendor_product(url, vendor, product)
    @checks.map{ |x| x.new.generate_checks("#{url}") }.flatten.compact.select{|x|
      x[:require_vendor_product] == "#{vendor}_#{product}".downcase.gsub(" ","_") }
  end


  #
  # Provide the full list of checks
  #
  def self.configuration_checks
    @checks.map{ |x| x.new.generate_checks("") }.flatten.compact.select{|x| x[:type] == "content" }
  end


end
end
end
end
