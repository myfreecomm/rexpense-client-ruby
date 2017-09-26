require 'spec_helper'

describe Rexpense::Entities::OrganizationCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Organization, 'organizations'
end
