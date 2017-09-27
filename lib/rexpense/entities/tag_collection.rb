module Rexpense
  module Entities
    #
    # A wrapper to Tag collection
    #
    class TagCollection < Collection
      def build_collection
        response.parsed_body['tags'].each do |attributes|
          collection.push(Rexpense::Entities::Tag.new(attributes))
        end
      end
    end
  end
end
