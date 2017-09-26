require 'spec_helper'

describe Rexpense::Entities::User do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:id, :name, :avatar]
end
