require 'spec_helper'

describe Rexpense::Entities::Comment do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [
    :id, :content, :content_html, :mentioned_users, :user,
    :created_at, :updated_at, :deleted_at
  ]
end
