require 'spec_helper'

describe Rexpense::Entities::CommentCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Comment, 'comments'
end
