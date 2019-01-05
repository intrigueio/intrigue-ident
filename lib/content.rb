module Intrigue
  module Ident
    module Content
      module Helpers

      def _body(content)
        _body_rendered(content) || _body_raw(content)
      end

      def _body_raw(content)
        content["details"]["hidden_response_data"]
      end

      def _body_rendered(content)
        content["details"]["hidden_response_data_rendered"]
      end

      def _body_raw_checksum(content)
        Digest::MD5.hexdigest("#{_body_raw(content)}")
      end

      def _body_rendered_checksum(content)
        Digest::MD5.hexdigest("#{_body_rendered(content)}")
      end

      def _generator(content)
        content["details"]["generator"]
      end

      def _title(content)
        content["details"]["title"]
      end

      def _headers(content)
        (content["details"]["headers"] || []).join("\n")
      end

      def _cookies(content)
        content["details"]["cookies"]
      end

    end
  end
end
end