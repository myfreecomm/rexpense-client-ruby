require 'spec_helper'

describe Rexpense::Entities::Organization do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:id, :name, :restricted_tags, :expired,
  :members_count, :logo, :created_at, :updated_at]
end
