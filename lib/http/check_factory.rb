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
    def self.configuration_checks
      @checks.map{ |x| x.new.generate_checks("") }.flatten.compact.select{|x| x[:type] == "content"}
    end


end
end
end
end
