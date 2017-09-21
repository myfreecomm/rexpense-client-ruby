require 'spec_helper'

describe Rexpense::Entities::PreExpenseCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::PreExpense, 'pre_expenses'
end
