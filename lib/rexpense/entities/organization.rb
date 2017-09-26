module Rexpense
  module Entities
    class Organization < Base
      attribute :id, Integer
      attribute :name, String
      attribute :restricted_tags, Boolean
      attribute :expired, Boolean
      attribute :members_count, Integer
      attribute :logo, Array[Hash]

      [:created_at, :updated_at].each { |n| attribute n, String }
    end
  end
end
