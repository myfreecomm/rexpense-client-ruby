require 'spec_helper'

describe Rexpense::Entities::ActivityCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Activity, 'activities'
end
