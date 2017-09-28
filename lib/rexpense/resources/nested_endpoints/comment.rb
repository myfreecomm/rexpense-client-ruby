module Rexpense::Resources
  module Comment
    #
    # Get resource comments
    #
    # [API]
    #   Method: <tt>GET /api/v1/reimbursements/:id/comments</tt>
    #   Method: <tt>GET /api/v1/expenses/:id/comments</tt>
    #   Method: <tt>GET /api/v1/advancements/:id/comments</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/comments#index
    def comments(resource_id)
      http.get(comment_endpoint(resource_id)) do |response|
        Rexpense::Entities::CommentCollection.build response
      end
    end

    #
    # Get resource comment
    #
    # [API]
    #   Method: <tt>GET /api/v1/reimbursements/:id/comments/:comment_id</tt>
    #   Method: <tt>GET /api/v1/expenses/:id/comments/:comment_id</tt>
    #   Method: <tt>GET /api/v1/advancements/:id/comments/:comment_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/comments#show
    def find_comment(resource_id, comment_id)
      http.get("#{comment_endpoint(resource_id)}/#{comment_id}") do |response|
        Rexpense::Entities::Comment.new response.parsed_body
      end
    end

    #
    # Create resource comment
    #
    # [API]
    #   Method: <tt>POST /api/v1/reimbursements/:id/comments</tt>
    #   Method: <tt>POST /api/v1/expenses/:id/comments</tt>
    #   Method: <tt>POST /api/v1/advancements/:id/comments</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/comments#create
    def create_comment(resource_id, params)
      http.post(comment_endpoint(resource_id), body: params) do |response|
        Rexpense::Entities::Comment.new response.parsed_body
      end
    end

    #
    # Update resource comment
    #
    # [API]
    #   Method: <tt>PUT /api/v1/reimbursements/:id/comments/:comment_id</tt>
    #   Method: <tt>PUT /api/v1/expenses/:id/comments/:comment_id</tt>
    #   Method: <tt>PUT /api/v1/advancements/:id/comments/:comment_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/comments#update
    def update_comment(resource_id, comment_id, params)
      http.put("#{comment_endpoint(resource_id)}/#{comment_id}", body: params) do |response|
        Rexpense::Entities::Comment.new response.parsed_body
      end
    end

    #
    # Destroy resource comment
    #
    # [API]
    #   Method: <tt>DELETE /api/v1/reimbursements/:id/comments/:comment_id</tt>
    #   Method: <tt>DELETE /api/v1/expenses/:id/comments/:comment_id</tt>
    #   Method: <tt>DELETE /api/v1/advancements/:id/comments/:comment_id</tt>
    #
    #   Documentation: http://developers.rexpense.com/api/comments#destroy
    def destroy_comment(resource_id, comment_id)
      http.delete("#{comment_endpoint(resource_id)}/#{comment_id}") do |response|
        true
      end
    end

    private

    def comment_endpoint(resource_id)
      "#{endpoint_base}/#{resource_id}/comments"
    end
  end
end
