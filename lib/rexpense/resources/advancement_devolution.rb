module Rexpense
  module Resources
    #
    # A wrapper to Rexpense advancement_devolutions API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/advancement_devolutions/
    #
    class AdvancementDevolution < Base

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

      private

      def endpoint_base
        "/advancement_devolutions"
      end
    end
  end
end
