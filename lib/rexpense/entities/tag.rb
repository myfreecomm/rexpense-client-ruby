module Rexpense
  module Entities
    class Tag < Base
      attribute :id, Integer
      attribute :name, String
      attribute :group, String
    end
  end
end
