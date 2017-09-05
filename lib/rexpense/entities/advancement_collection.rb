module Rexpense
  module Entities
    #
    # A wrapper to Advancement collection
    #
    class AdvancementCollection < Collection
      def build_collection
        response.parsed_body['advancements'].each do |attributes|
          collection.push(Rexpense::Entities::Advancement.new(attributes))
        end
      end
    end
  end
end
