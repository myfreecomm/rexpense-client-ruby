module Rexpense
  module Resources
    #
    # A wrapper to Rexpense advancement_devolutions API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/advancement_devolutions/
    #
    class AdvancementDevolution < ResourceBase

      private

      def endpoint_base
        "/advancement_devolutions"
      end
    end
  end
end
