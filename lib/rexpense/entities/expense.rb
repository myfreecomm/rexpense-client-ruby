module Rexpense
  module Entities
    class Expense < Base
      [:id, :attachments_count, :comments_count, :activities_count,
        :travel_time].each { |n| attribute n, Integer }

      [:description, :currency, :approved_amount_currency, :kind, :status,
        :distance_kind, :destination, :origin].each { |n| attribute n, String }

      [:amount, :approved_amount, :latitude, :longitude, :distance,
        :destination_latitude, :destination_longitude, :origin_longitude,
        :origin_latitude].each { |n| attribute n, Decimal }

      attribute :tags, Array[String]
      attribute :liquidate_through_advancement, Boolean
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end
