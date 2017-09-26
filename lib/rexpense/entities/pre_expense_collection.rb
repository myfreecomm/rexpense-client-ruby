module Rexpense
  module Entities
    #
    # A wrapper to PreExpense collection
    #
    class PreExpenseCollection < Collection
      def build_collection
        response.parsed_body['pre_expenses'].each do |attributes|
          collection.push(Rexpense::Entities::PreExpense.new(attributes))
        end
      end
    end
  end
end
