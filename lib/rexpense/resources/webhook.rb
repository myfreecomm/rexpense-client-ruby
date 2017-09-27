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
        "/webhooks"
      end
    end
  end
end
