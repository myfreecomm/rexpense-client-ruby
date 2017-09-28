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

    # Define available endpoints

    def activities
      Rexpense::Resources::Activity.new(http)
    end

    def advancement_devolutions
      Rexpense::Resources::AdvancementDevolution.new(http)
    end

    def pre_expenses
      Rexpense::Resources::PreExpense.new(http)
    end

    %w(organization expense advancement reimbursement tag webhook membership comment).each do |endpoint|
      define_method(endpoint + 's') do
        Object.const_get("Rexpense::Resources::#{endpoint.capitalize}").new(http)
      end
    end
  end
end
