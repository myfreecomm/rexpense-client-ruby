require 'spec_helper'

describe Rexpense::Entities::Tag do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:id, :name, :group]
end
