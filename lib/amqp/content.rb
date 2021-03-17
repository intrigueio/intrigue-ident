module Intrigue
  module Ident
    module Amqp
      module Content
        def _tcp_response(content)
          content["details"]["tcp_response"]
        end
      end
    end
  end
end
