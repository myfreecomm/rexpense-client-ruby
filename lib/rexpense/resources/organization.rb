module Rexpense
  module Resources
    #
    # A wrapper to Rexpense organizations API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/organizations/
    #
    class Organization < ResourceBase
      include Rexpense::Resources::Membership

      def distances_rules(id)
        http.get("#{endpoint_base}/#{id}/distances_rules") do |response|
          response.parsed_body.first
        end
      end

      def update_distances_rules(id, params)
        http.post("#{endpoint_base}/#{id}/distances_rules", body: params) do |response|
          response.parsed_body.first
        end
      end

      private

      def endpoint_base
        "/organizations"
      end
    end
  end
end
