module Rexpense
  module Entities
    class Comment < Base
      attribute :id, Integer
      attribute :content, String
      attribute :content_html, String
      attribute :mentioned_users, Array[Rexpense::Entities::User]
      attribute :user, Rexpense::Entities::User

      [:created_at, :updated_at, :deleted_at].each { |n| attribute n, String }
    end
  end
end
