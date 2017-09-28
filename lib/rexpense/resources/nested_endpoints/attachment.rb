module Rexpense::Resources
  module Attachment
    #
    # Get resource attachments
    #
    # [API]
    #   Method: <tt>GET /api/v1/expenses/:id/attachments</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/attachments#index
    def attachments(resource_id)
      http.get(attachment_endpoint(resource_id)) do |response|
        Rexpense::Entities::AttachmentCollection.build response
      end
    end

    #
    # Get resource attachment
    #
    # [API]
    #   Method: <tt>GET /api/v1/expenses/:id/attachments/:id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/attachments#show
    def find_attachment(resource_id, attachment_id)
      http.get("#{attachment_endpoint(resource_id)}/#{attachment_id}") do |response|
        Rexpense::Entities::Attachment.new response.parsed_body
      end
    end

    #
    # Destroy resource attachment
    #
    # [API]
    #   Method: <tt>DELETE /api/v1/expenses/:id/attachments/:id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/attachments#show
    def destroy_attachment(resource_id, attachment_id)
      http.delete("#{attachment_endpoint(resource_id)}/#{attachment_id}") do |response|
        true
      end
    end

    private

    def attachment_endpoint(resource_id)
      "#{endpoint_base}/#{resource_id}/attachments"
    end
  end
end
