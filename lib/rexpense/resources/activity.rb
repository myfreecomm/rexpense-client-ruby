module Rexpense
  module Resources
    #
    # A wrapper to Rexpense activity API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/activities/
    #
    class Activity < Base
      #
      # Get user activities
      #
      # [API]
      #   Method: <tt>GET /api/v1/activities</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/activities#index
      def find_all
        http.get('/activities') do |response|
          Rexpense::Entities::ActivityCollection.build response
        end
      end
    end
  end
end
