module Rexpense
  module Resources
    #
    # A wrapper to Rexpense advancements API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/advancements/
    #
    class Advancement < ResourceBase
      include Rexpense::Resources::Comment
      include Rexpense::Resources::Participant

      private

      def endpoint_base
        "/advancements"
      end
    end
  end
end
