require "base64"

module Rexpense
  class Configuration
    attr_accessor :user_agent, :api_mode, :version

    def initialize
      @api_mode = 'production'
      @version = 'v1'
      @user_agent = "Rexpense Ruby Client v#{Rexpense::VERSION}"
    end
  end
end
