require 'spec_helper'

describe Rexpense::Entities::AdvancementCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Advancement, 'advancements'
end
