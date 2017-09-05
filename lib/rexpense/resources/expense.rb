module Rexpense
  module Resources
    #
    # A wrapper to Rexpense expenses API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/expenses/
    #
    class Expense < Base
      #
      # List all expenses
      #
      # [API]
      #   Method: <tt>GET /api/v1/expenses</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#index
      #
      def find_all(params = {})
        search_endpoint = build_search_endpoint(params)

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find an expense
      #
      # [API]
      #   Method: <tt>GET /api/v1/expenses/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#show
      #
      def find(id)
        http.get("#{endpoint_base}/#{id}", body: {}) do |response|
          respond_with_object response
        end
      end

      #
      # Create an expense
      #
      # [API]
      #   Method: <tt>POST /api/v1/expenses</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#create
      #
      def create(params)
        http.post("#{endpoint_base}", body: params) do |response|
          respond_with_object response
        end
      end

      #
      # Updates an expense
      #
      # [API]
      #   Method: <tt>PUT /api/v1/expenses/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#update
      #
      def update(id, params = {})
        http.patch("#{endpoint_base}/#{id}", body: params) do |response|
          respond_with_object response
        end
      end

      #
      # Destroy an expense
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/expenses/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#destroy
      #
      def destroy(id)
        http.delete("#{endpoint_base}/#{id}", body: {}) do |response|
          true
        end
      end

      private

      def endpoint_base
        "/api/v1/expenses"
      end
    end
  end
end
