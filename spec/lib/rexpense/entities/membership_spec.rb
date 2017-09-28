require 'spec_helper'

describe Rexpense::Entities::Membership do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:id, :role, :organization, :user]
end
