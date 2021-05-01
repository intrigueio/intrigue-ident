module Intrigue
  module Ident
    module Smb
      class CheckFactory
        #
        # Register a new handler
        #

        def self.inherited(base)
          Intrigue::Ident::Base::CheckFactory.register(base)
        end

        # def self.register(klass)
        #   @checks ||= []
        #   @checks << klass if klass
        # end

        # #
        # # Provide the full list of checks
        # #
        # def self.checks
        #   @checks || []
        # end
      end
    end
  end
end
