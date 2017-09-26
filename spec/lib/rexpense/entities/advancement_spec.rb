require 'spec_helper'

describe Rexpense::Entities::Advancement do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :comments_count, :activities_count, :description, :currency,
    :amount, :tags, :created_at, :updated_at, :payer, :receiver
  ]
end
