require 'spec_helper'

describe Rexpense::Entities::User do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :first_name, :last_name, :mention_name,
    :default_currency, :name, :avatar, :default_avatar
  ]
end
