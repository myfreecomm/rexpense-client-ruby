require 'spec_helper'

describe Rexpense::Entities::AdvancementDevolution do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :currency, :amount, :deleted_at, :date, :payer, :receiver
  ]
end
