require 'spec_helper'

describe Rexpense::Entities::Activity do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :subject, :source, :user, :changes
  ]
end
