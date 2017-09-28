module Rexpense
  module Entities
    class ExpenseStatus < Base
      attribute :status, Array[Hash]
    end
  end
end
