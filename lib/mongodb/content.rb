module Intrigue
  module Ident
    module MongoDb
      module Content
        def _response(content)
          content["details"]["response"]
        end
      end
    end
  end
end
