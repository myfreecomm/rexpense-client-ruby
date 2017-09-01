module Rexpense
  module Entities
    #
    # A wrapper to Expense collection
    #
    class ExpenseCollection < Collection
      def build_collection
        response.parsed_body.each do |attributes|
          collection.push(Rexpense::Entities::Expense.new(attributes['expenses']))
        end
      end
    end
  end
end
