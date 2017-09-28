module Rexpense::Resources
  module Participant
    #
    # Get resource participants tags
    #
    # [API]
    #   Method: <tt>GET /api/v1/reimbursements/:id/participants</tt>
    #   Method: <tt>GET /api/v1/expenses/:id/participants</tt>
    #   Method: <tt>GET /api/v1/advancements/:id/participants</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/participants#index
    #   Documentation: http://developers.rexpense.com/api/expense_participants#index
    #   Documentation: http://developers.rexpense.com/api/reimbursement_participants#index
    def participants(resource_id)
      http.get(participants_endpoint(resource_id)) do |response|
        Rexpense::Entities::UserCollection.build response
      end
    end

    #
    # Get resource participants tags
    #
    # [API]
    #   Method: <tt>GET /api/v1/reimbursements/:id/participants</tt>
    #   Method: <tt>GET /api/v1/expenses/:id/participants</tt>
    #   Method: <tt>GET /api/v1/advancements/:id/participants</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/advancement_participants#destroy
    #   Documentation: http://developers.rexpense.com/api/expense_participants#destroy
    #   Documentation: http://developers.rexpense.com/api/reimbursement_participants#destroy
    def leave_participant(resource_id)
      http.delete(participants_endpoint(resource_id)) do |response|
        true
      end
    end

    private

    def participants_endpoint(resource_id)
      "#{endpoint_base}/#{resource_id}/participants"
    end
  end
end
