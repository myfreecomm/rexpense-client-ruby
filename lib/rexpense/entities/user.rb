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
      attribute :emails, Array[Hash]
      attribute :email, String, default: lambda { |page, attribute| select_email(page.emails) }

      private

      def self.select_email(emails_list)
        main_email = nil
        emails_list.each do |email_data|
          if email_data['main']
            main_email = email_data['email']; break
          end
        end
        main_email
      end
    end
  end
end
