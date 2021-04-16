module Intrigue
  module Ident
    module Smb
      module Content
        def _response(content)
          content["details"]["response"]
        end
      end
    end
  end
end
