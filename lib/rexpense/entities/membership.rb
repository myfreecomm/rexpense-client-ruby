module Rexpense
  module Entities
    class Membership < Base
      attribute :id, Integer
      attribute :role, String
      attribute :organization, Rexpense::Entities::Organization
      attribute :user, Rexpense::Entities::User
    end
  end
end
