require "rexpense/request"
require "rexpense/response"

module Rexpense
  class Http
    attr_reader :token

    def initialize(token)
      @token = token
    end

    %w[get post delete put patch].each do |m|
      define_method(m) do |path, options = {}, &block|
        send_request(m.to_sym, path, options, &block)
      end
    end

    private

    def send_request(method, path, options, &block)
      request = Request.new(
        options.merge!(
          method: method,
          token: token,
          url: "#{Rexpense.configuration.url}#{path}",
          user_agent: Rexpense.configuration.user_agent
        )
      )
      Response.new(request.run).resolve!(&block)
    end
  end
end
