module Rexpense
  module Entities
    class Attachment < Base
      attribute :id, Integer
      attribute :description, String
      attribute :content_type, String
      attribute :file_name, String
      attribute :url, String
      attribute :user, Rexpense::Entities::User
      attribute :uploaded_at, DateTime
    end
  end
end
