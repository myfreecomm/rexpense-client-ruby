module Rexpense
  module Entities
    #
    # A wrapper to Tag collection
    #
    class UserCollection < Collection
      def build_collection
        response.parsed_body['participants'].each do |attributes|
          collection.push(Rexpense::Entities::User.new(attributes))
        end
      end
    end
  end
end
