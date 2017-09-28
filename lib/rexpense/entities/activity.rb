module Rexpense
  module Entities
    class Activity < Base
      attribute :id, Integer
      attribute :subject, Hash
      attribute :source, Hash
      attribute :user, Rexpense::Entities::Organization
      attribute :changes, String
    end
  end
end
