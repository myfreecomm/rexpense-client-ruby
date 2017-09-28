require 'spec_helper'

describe Rexpense::Entities::ExpenseStatus do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:status]
end
