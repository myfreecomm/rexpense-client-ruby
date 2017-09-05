module Rexpense
  module Resources
    class Base

      attr_accessor :http

      def initialize(http)
        @http = http
      end

      private

      def build_search_endpoint(params)
        return URI.encode("#{endpoint_base}") if params.empty?
        query_string = uri_query(params).join("&")
        URI.encode("#{endpoint_base}?#{query_string}")
      end

      def uri_query(params)
        page = params.delete(:page)
        query = []
        params.each { |k, v| query += query_value(k, v) }
        query << "page=#{page}" if page
        query
      end

      def query_value(key, value)
        [].tap do |query|
          if value.is_a?(Array)
            value.each { |v| query << "q[#{key}][]=#{v}" }
          else
            query << "q[#{key}]=#{value}"
          end
        end
      end

      def respond_with_collection(response)
        collection_klass = Rexpense::Entities.const_get("#{entity_klass_name}Collection")
        collection_klass.build(response)
      end

      def respond_with_object(response, key=nil)
        entity_klass = Rexpense::Entities.const_get(entity_klass_name)
        entity_klass.new(response.parsed_body(key))
      end

      def entity_klass_name
        self.class.to_s.gsub("Resources", "Entities")
      end
    end
  end
end
