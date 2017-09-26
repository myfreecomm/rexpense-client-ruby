module Rexpense
  module Entities
    class User < Base
      attribute :id, Integer
      attribute :name, String
      attribute :avatar, Array[Hash]
    end
  end
end
