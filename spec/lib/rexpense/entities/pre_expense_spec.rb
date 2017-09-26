require 'spec_helper'

describe Rexpense::Entities::PreExpense do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :amount, :description, :currency, :created_at, :converted_at, :updated_at,
    :ignored_at, :occurred_at, :tags, :payer, :receiver
  ]
end
