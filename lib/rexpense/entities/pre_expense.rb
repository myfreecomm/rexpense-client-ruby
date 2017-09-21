module Rexpense
  module Entities
    class PreExpense < Base
      attribute :id, Integer
      attribute :amount, Decimal

      [:description, :currency].each { |n| attribute n, String }

      [:created_at, :converted_at, :updated_at,
       :ignored_at, :occurred_at].each { |n| attribute n, String }

      attribute :tags, Array[String]
    end
  end
end
