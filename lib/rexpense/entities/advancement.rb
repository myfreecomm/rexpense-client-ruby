module Rexpense
  module Entities
    class Advancement < Base
      [:id, :comments_count, :activities_count].each { |n| attribute n, Integer }
      [:description, :currency].each { |n| attribute n, String }
      attribute :amount, Decimal
      attribute :tags, Array[String]
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
