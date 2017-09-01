require 'spec_helper'

describe Rexpense::Entities::Expense do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :attachments_count, :comments_count, :activities_count, :travel_time,
    :description, :currency, :approved_amount_currency, :kind, :status,
    :distance_kind, :destination, :origin, :amount, :approved_amount, :latitude,
    :longitude, :distance, :destination_latitude, :destination_longitude,
    :origin_longitude, :origin_latitude, :tags, :liquidate_through_advancement,
    :created_at, :updated_at
  ]
end
