module Rexpense
  module Entities
    class AdvancementDevolution < Base
      attribute :id, Integer
      attribute :currency, String
      attribute :amount, Decimal
      attribute :deleted_at, DateTime
      attribute :date, DateTime
      attribute :payer, Rexpense::Entities::Organization
      attribute :receiver, Rexpense::Entities::User
    end
  end
end
