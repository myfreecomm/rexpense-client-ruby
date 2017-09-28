module Rexpense
  module Resources
    #
    # A wrapper to Rexpense expenses API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/expenses/
    #
    class Expense < ResourceBase
      include Rexpense::Resources::Comment
      include Rexpense::Resources::Participant
      include Rexpense::Resources::Attachment

      def status(id)
        http.get("#{search_endpoint}/#{id}/status") do |response|
          Rexpense::Entities::ExpenseStatus.new response.parsed_body
        end
      end

      def update_status(id, params)
        http.put("#{search_endpoint}/#{id}/status", body: params) do |response|
          Rexpense::Entities::ExpenseStatus.new response.parsed_body
        end
      end

      def mentionables(id)
        http.get("#{endpoint_base}/#{id}/mentionables") do |response|
          Rexpense::Entities::UserCollection.build response.parsed_body
        end
      end

      private

      def endpoint_base
        "/expenses"
      end
    end
  end
end
