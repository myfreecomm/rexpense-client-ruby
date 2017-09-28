module Rexpense
  module Entities
    #
    # A wrapper to Membership collection
    #
    class MembershipCollection < Collection
      def build_collection
        response.parsed_body['memberships'].each do |attributes|
          collection.push(Rexpense::Entities::Membership.new(attributes))
        end
      end
    end
  end
end
