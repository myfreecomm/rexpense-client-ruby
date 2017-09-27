require 'spec_helper'

describe Rexpense::Entities::Webhook do
  subject { described_class.new({}) }

  it_behaves_like "entity_attributes", [:id, :url, :description, :secret]
end
