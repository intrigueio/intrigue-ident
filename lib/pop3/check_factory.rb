module Intrigue
  module Ident
    module Pop3
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
      end
    end
  end
end
