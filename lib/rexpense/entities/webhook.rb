module Rexpense
  module Entities
    class Webhook < Base
      attribute :id, Integer
      attribute :url, String
      attribute :description, String
      attribute :secret, String
    end
  end
end
