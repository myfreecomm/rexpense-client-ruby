module Rexpense
  module Resources
    #
    # A wrapper to Rexpense resources API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/expenses/
    #   Documentation: http://developers.rexpense.com/api/v1/advancements/
    #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/
    #
    class ResourceBase < Base
      #
      # List all resources
      #
      # [API]
      #   Method: <tt>GET /api/v1/expenses</tt>
      #   Method: <tt>GET /api/v1/advancements</tt>
      #   Method: <tt>GET /api/v1/reimbursements</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#index
      #   Documentation: http://developers.rexpense.com/api/v1/advancements/#index
      #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/#index
      #
      def find_all(params = {})
        search_endpoint = build_search_endpoint(params)

        http.get(search_endpoint) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find a resource
      #
      # [API]
      #   Method: <tt>GET /api/v1/expenses/:id</tt>
      #   Method: <tt>GET /api/v1/advancements/:id</tt>
      #   Method: <tt>GET /api/v1/reimbursements/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#show
      #   Documentation: http://developers.rexpense.com/api/v1/advancements/#show
      #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/#show
      #
      def find(id)
        http.get("#{endpoint_base}/#{id}", body: {}) do |response|
          respond_with_object response
        end
      end

      #
      # Create a resource
      #
      # [API]
      #   Method: <tt>POST /api/v1/expenses</tt>
      #   Method: <tt>POST /api/v1/advancements</tt>
      #   Method: <tt>POST /api/v1/reimbursements</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#create
      #   Documentation: http://developers.rexpense.com/api/v1/advancements/#create
      #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/#create
      #
      def create(params)
        http.post("#{endpoint_base}", body: params) do |response|
          respond_with_object response
        end
      end

      #
      # Updates a resource
      #
      # [API]
      #   Method: <tt>PATCH /api/v1/expenses/:id</tt>
      #   Method: <tt>PATCH /api/v1/advancements/:id</tt>
      #   Method: <tt>PATCH /api/v1/reimbursements/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#update
      #   Documentation: http://developers.rexpense.com/api/v1/advancements/#update
      #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/#update
      #
      def update(id, params = {})
        http.patch("#{endpoint_base}/#{id}", body: params) do |response|
          respond_with_object response
        end
      end

      #
      # Destroy a resource
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/expenses/:id</tt>
      #   Method: <tt>DELETE /api/v1/advancements/:id</tt>
      #   Method: <tt>DELETE /api/v1/reimbursements/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/expenses/#destroy
      #   Documentation: http://developers.rexpense.com/api/v1/advancements/#destroy
      #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/#destroy
      #
      def destroy(id)
        http.delete("#{endpoint_base}/#{id}", body: {}) do |response|
          true
        end
      end
    end
  end
end
