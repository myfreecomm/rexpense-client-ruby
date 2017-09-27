require "rexpense/request"
require "rexpense/response"

module Rexpense
  class Client
    attr_reader :http

    def initialize(token)
      @http = Http.new(token)
    end

    def authenticated?
      http.get("/organizations") { |response| response.code == 200 }
    rescue RequestError => e
      raise e unless [401, 403].include?(e.code)
      false
    end

    def organizations
      Rexpense::Resources::Organization.new(http)
    end

    def pre_expenses
      Rexpense::Resources::PreExpense.new(http)
    end

    def expenses
      Rexpense::Resources::Expense.new(http)
    end

    def advancements
      Rexpense::Resources::Advancement.new(http)
    end

    def advancement_devolutions
      Rexpense::Resources::AdvancementDevolution.new(http)
    end

    def reimbursements
      Rexpense::Resources::Reimbursement.new(http)
    end

    def webhooks
      Rexpense::Resources::Webhook.new(http)
    end
  end
end
