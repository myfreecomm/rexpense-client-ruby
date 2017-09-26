module Rexpense
  module Entities
    #
    # A wrapper to Organization collection
    #
    class OrganizationCollection < Collection
      def build_collection
        response.parsed_body['organizations'].each do |attributes|
          collection.push(Rexpense::Entities::Organization.new(attributes))
        end
      end
    end
  end
end
