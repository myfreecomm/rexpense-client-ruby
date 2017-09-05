module Rexpense
  module Entities
    #
    # A wrapper to Expense collection
    #
    class ExpenseCollection < Collection
      def build_collection
        response.parsed_body['expenses'].each do |attributes|
          collection.push(Rexpense::Entities::Expense.new(attributes))
        end
      end
    end
  end
end
