module Rexpense
  module Resources
    #
    # A wrapper to Rexpense pre_expenses API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/pre_expenses/
    #
    class PreExpense < ResourceBase
      #
      # Ignore a pre_expense resource
      #
      # [API]
      #   Method: <tt>PUT /api/v1/pre_expenses/ignore</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/pre_expenses/#ignore
      def ignore(id)
        http.put("#{endpoint_base}/#{id}/ignore") do |response|
          respond_with_object response
        end
      end

      #
      # Restore a pre_expense resource
      #
      # [API]
      #   Method: <tt>PUT /api/v1/pre_expenses/restore</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/pre_expenses/#ignore
      def restore(id)
        http.put("#{endpoint_base}/#{id}/restore") do |response|
          respond_with_object response
        end
      end

      #
      # Restore a pre_expense resource
      #
      # [API]
      #   Method: <tt>POST /api/v1/pre_expenses/convert</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/v1/pre_expenses/#convert
      def convert(id, params={})
        http.post("#{endpoint_base}/#{id}/convert", body: params) do |response|
          Rexpense::Entities::Expense.new response.parsed_body
        end
      end

      private

      def endpoint_base
        "/api/v1/pre_expenses"
      end
    end
  end
end
