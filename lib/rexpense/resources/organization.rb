module Rexpense
  module Resources
    #
    # A wrapper to Rexpense organizations API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/organizations/
    #
    class Organization < ResourceBase

      private

      def endpoint_base
        "/api/v1/organizations"
      end
    end
  end
end
