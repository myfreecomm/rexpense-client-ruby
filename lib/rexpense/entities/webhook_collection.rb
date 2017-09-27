module Rexpense
  module Entities
    #
    # A wrapper to Webhooks collection
    #
    class WebhookCollection < Collection
      def build_collection
        response.parsed_body['webhooks'].each do |attributes|
          collection.push(Rexpense::Entities::Webhook.new(attributes))
        end
      end
    end
  end
end
