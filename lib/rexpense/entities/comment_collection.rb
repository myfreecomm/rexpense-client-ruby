module Rexpense
  module Entities
    #
    # A wrapper to Comment collection
    #
    class CommentCollection < Collection
      def build_collection
        response.parsed_body['comments'].each do |attributes|
          collection.push(Rexpense::Entities::Comment.new(attributes))
        end
      end
    end
  end
end
