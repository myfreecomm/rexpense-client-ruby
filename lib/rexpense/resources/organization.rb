module Rexpense
  module Resources
    #
    # A wrapper to Rexpense organizations API
    #
    # [API]
    #   Documentation: http://developers.rexpense.com/api/v1/organizations/
    #
    class Organization < ResourceBase
      #
      # Get organization tags
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:id/tags</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#index
      def tags(id)
        http.get("#{endpoint_base}/#{id}/tags") do |response|
          Rexpense::Entities::TagCollection.build response
        end
      end

      #
      # Find a organization tag
      #
      # [API]
      #   Method: <tt>GET /api/v1/organization/:id/tags/:tag_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#show
      def find_tag(id, tag_id)
        http.get("#{endpoint_base}/#{id}/tags/#{tag_id}") do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Create a organization tag
      #
      # [API]
      #   Method: <tt>POST /api/v1/organization/:id/tags</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#create
      def create_tag(id, params={})
        http.post("#{endpoint_base}/#{id}/tags", body: params) do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Update a organization tag
      #
      # [API]
      #   Method: <tt>PUT /api/v1/organization/:id/tags/:tag_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#update
      def update_tag(id, tag_id, params={})
        http.put("#{endpoint_base}/#{id}/tags/#{tag_id}", body: params) do |response|
          Rexpense::Entities::Tag.new response.parsed_body
        end
      end

      #
      # Create a organization tag
      #
      # [API]
      #   Method: <tt>DELETE /api/v1/organization/:id/tags/:tag_id</tt>
      #
      #   Documentation: http://developers.rexpense.com/api/tags#destroy
      def destroy_tag(id, tag_id)
        http.delete("#{endpoint_base}/#{id}/tags/#{tag_id}") do |response|
          true
        end
      end

      private

      def endpoint_base
        "/organizations"
      end
    end
  end
end
