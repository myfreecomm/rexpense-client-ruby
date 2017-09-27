module Rexpense
  module Resources
    #
    # A wrapper to Rexpense organizations API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/organizations/
    #
    class Webhook < Base
      #
      # Get organization webhooks
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:id/integrations/webhooks</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/webhooks#index
      def find_all(id)
        http.get(endpoint_base(id)) do |response|
          Rexpense::Entities::WebhookCollection.build response
        end
      end

      #
      # Find a organization Webhook
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:id/integrations/webhooks/:webhook_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/webhooks#show
      def find(id, webhook_id)
        http.get("#{endpoint_base(id)}/#{webhook_id}") do |response|
          Rexpense::Entities::Webhook.new response.parsed_body
        end
      end

      #
      # Create a organization Webhook
      #
      # [API]
      #   Method: <tt>POST /api/v1/organization/:id/integrations/webhooks</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/webhooks#create
      def create(id, params={})
        http.post(endpoint_base(id), body: params) do |response|
          Rexpense::Entities::Webhook.new response.parsed_body
        end
      end

      #
      # Update a organization Webhook
      #
      # [API]
      #   Method: <tt>PUT /api/v1/organization/:id/integrations/webhooks/:webhook_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/webhooks#update
      def update(id, webhook_id, params={})
        http.put("#{endpoint_base(id)}/#{webhook_id}", body: params) do |response|
          Rexpense::Entities::Webhook.new response.parsed_body
        end
      end

      #
      # Create a organization Webhook
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/organization/:id/integrations/webhooks/:webhook_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/webhooks#destroy
      def destroy(id, webhook_id)
        http.delete("#{endpoint_base(id)}/#{webhook_id}") do |response|
          true
        end
      end

      private

      def endpoint_base(id)
        "/organizations/#{id}/integrations/webhooks"
      end
    end
  end
end
