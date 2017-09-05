module Rexpense
  module Resources
    #
    # A wrapper to Rexpense advancements API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/advancements/
    #
    class Advancement < ResourceBase

      private

      def endpoint_base
        "/api/v1/advancements"
      end
    end
  end
end
