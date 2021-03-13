module Intrigue
  module Ident
    module ElasticSearch
      module Content
        def _response_body(content)
          content["details"]["response_body"]
        end
      end
    end
  end
end
