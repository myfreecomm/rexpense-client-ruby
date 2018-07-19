module Rexpense
  module Resources
    #
    # A wrapper to Rexpense Tag API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/tags
    #
    class Tag < ResourceBase
      #
      # Get organization tags
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:organization_id/tags</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#index
      def find_all(organization_id)
        http.get(endpoint_base(organization_id)) do |response|
          Rexpense::Entities::TagCollection.build response
        end
      end

      #
      # Find a organization tag
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:organization_id/tags/:tag_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#show
      def find(organization_id, id)
        http.get("#{endpoint_base(organization_id)}/#{id}") do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Create a organization tag
      #
      # [API]
      #   Method: <tt>POST /api/v1/organization/:organization_id/tags</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#create
      def create(organization_id, params={})
        http.post(endpoint_base(organization_id), body: params) do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Update a organization tag
      #
      # [API]
      #   Method: <tt>PUT /api/v1/organization/:organization_id/tags/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#update
      def update(organization_id, id, params={})
        http.put("#{endpoint_base(organization_id)}/#{id}", body: params) do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Create a organization tag
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/organization/:organization_id/tags/:id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#destroy
      def destroy(organization_id, id)
        http.delete("#{endpoint_base(organization_id)}/#{id}") do |response|
          true
        end
      end

      private

      def endpoint_base(id)
        "/organizations/#{id}/tags"
      end
    end
  end
end
