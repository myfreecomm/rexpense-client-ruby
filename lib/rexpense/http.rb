require "rexpense/request"
require "rexpense/response"

module Rexpense
  class Http
    attr_reader :token, :base_url

    SANDBOX_URL = "https://sandbox.rexpense.com/api"
    PRODUCTION_URL = "https://app.rexpense.com/api"

    def initialize(token)
      @token = token
      @base_url = api_url + "/#{Rexpense.configuration.version}"
    end

    %w[get post delete put patch].each do |m|
      define_method(m) do |path, options = {}, &block|
        send_request(m.to_sym, path, options, &block)
      end
    end

    private

    def api_url
      return PRODUCTION_URL if Rexpense.configuration.api_mode == 'production'
      SANDBOX_URL
    end

    def send_request(method, path, options, &block)
      request = Request.new(
        options.merge!(
          method: method,
          token: token,
          url: "#{base_url}#{path}",
          user_agent: Rexpense.configuration.user_agent
        )
      )
      Response.new(request.run).resolve!(&block)
    end
  end
end
