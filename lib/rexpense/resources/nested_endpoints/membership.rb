module Rexpense::Resources
  module Membership
    #
    # Get organization memberships
    #
    # [API]
    #   Method: <tt>GET /api/v1/organizations/:id/memberships</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/memberships#index
    def memberships(organization_id)
      http.get(membership_endpoint(organization_id)) do |response|
        Rexpense::Entities::MembershipCollection.build response
      end
    end

    #
    # Get organization membership
    #
    # [API]
    #   Method: <tt>GET /api/v1/organizations/:id/memberships/:membership_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/memberships#show
    def find_membership(organization_id, membership_id)
      http.get("#{membership_endpoint(organization_id)}/#{membership_id}") do |response|
        Rexpense::Entities::Membership.new response.parsed_body
      end
    end

    #
    # Create organization membership
    #
    # [API]
    #   Method: <tt>POST /api/v1/organizations/:id/memberships</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/memberships#create
    def create_membership(organization_id, params)
      http.post(membership_endpoint(organization_id), body: params) do |response|
        response.parsed_body
      end
    end

    #
    # Update organization membership
    #
    # [API]
    #   Method: <tt>PUT /api/v1/organizations/:id/memberships/:membership_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/memberships#update
    def update_membership(organization_id, membership_id, params)
      http.put("#{membership_endpoint(organization_id)}/#{membership_id}", body: params) do |response|
        Rexpense::Entities::Membership.new response.parsed_body
      end
    end

    #
    # Destroy organization membership
    #
    # [API]
    #   Method: <tt>DELETE /api/v1/organizations/:id/memberships/:membership_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/memberships#destroy
    def destroy_membership(organization_id, membership_id)
      http.delete("#{membership_endpoint(organization_id)}/#{membership_id}") do |response|
        true
      end
    end

    private

    def membership_endpoint(organization_id)
      "#{endpoint_base}/#{organization_id}/members"
    end
  end
end
