require 'spec_helper'

describe Rexpense::Entities::TagCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Tag, 'tags'
end
