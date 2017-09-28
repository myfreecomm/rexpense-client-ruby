module Rexpense
  module Entities
    #
    # A wrapper to Activity collection
    #
    class ActivityCollection < Collection
      def build_collection
        response.parsed_body['activities'].each do |attributes|
          collection.push(Rexpense::Entities::Activity.new(attributes))
        end
      end
    end
  end
end
