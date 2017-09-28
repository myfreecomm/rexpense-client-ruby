module Rexpense
  module Entities
    class User < Base
      attribute :id, Integer
      attribute :first_name, String
      attribute :last_name, String
      attribute :mention_name, String
      attribute :default_currency, String
      attribute :name, String
      attribute :avatar, Array[Hash]
      attribute :default_avatar, Boolean
    end
  end
end
