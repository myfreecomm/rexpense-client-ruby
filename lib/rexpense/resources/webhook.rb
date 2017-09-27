module Rexpense
  module Resources
    #
    # A wrapper to Rexpense webhooks API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/webhooks/
    #
    class Webhook < ResourceBase

      private

      def endpoint_base
        "/api/v1/webhooks"
      end
    end
  end
end
