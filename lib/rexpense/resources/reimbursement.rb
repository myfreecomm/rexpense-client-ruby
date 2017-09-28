module Rexpense
  module Resources
    #
    # A wrapper to Rexpense reimbursements API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/reimbursements/
    #
    class Reimbursement < ResourceBase
      include Rexpense::Resources::Comment
      include Rexpense::Resources::Participant

      private

      def endpoint_base
        "/reimbursements"
      end
    end
  end
end
