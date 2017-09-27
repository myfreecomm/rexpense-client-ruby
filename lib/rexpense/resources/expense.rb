module Rexpense
  module Resources
    #
    # A wrapper to Rexpense expenses API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/expenses/
    #
    class Expense < ResourceBase

      private

      def endpoint_base
        "/expenses"
      end
    end
  end
end
