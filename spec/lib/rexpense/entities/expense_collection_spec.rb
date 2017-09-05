require 'spec_helper'

describe Rexpense::Entities::ExpenseCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Expense, 'expenses'
end
