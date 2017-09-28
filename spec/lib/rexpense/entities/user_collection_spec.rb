require 'spec_helper'

describe Rexpense::Entities::UserCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::User, 'participants'
end
