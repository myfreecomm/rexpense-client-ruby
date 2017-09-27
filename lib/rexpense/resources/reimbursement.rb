module Rexpense
  module Resources
    #
    # A wrapper to Rexpense reimbursements API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/
    #
    class Reimbursement < ResourceBase

      private

      def endpoint_base
        "/reimbursements"
      end
    end
  end
end
