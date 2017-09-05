require 'spec_helper'

describe Rexpense::Entities::ReimbursementCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Reimbursement, 'reimbursements'
end
