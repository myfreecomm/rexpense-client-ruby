module Rexpense
  module Entities
    #
    # A wrapper to Reimbursement collection
    #
    class ReimbursementCollection < Collection
      def build_collection
        response.parsed_body['reimbursements'].each do |attributes|
          collection.push(Rexpense::Entities::Reimbursement.new(attributes))
        end
      end
    end
  end
end
