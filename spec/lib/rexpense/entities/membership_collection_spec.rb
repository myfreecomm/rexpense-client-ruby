require 'spec_helper'

describe Rexpense::Entities::MembershipCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Membership, 'memberships'
end
