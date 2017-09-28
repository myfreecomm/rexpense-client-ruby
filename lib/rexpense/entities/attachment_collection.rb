module Rexpense
  module Entities
    #
    # A wrapper to Attachment collection
    #
    class AttachmentCollection < Collection
      def build_collection
        response.parsed_body['attachments'].each do |attributes|
          collection.push(Rexpense::Entities::Attachment.new(attributes))
        end
      end
    end
  end
end
