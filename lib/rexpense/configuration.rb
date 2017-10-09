require "base64"

module Rexpense
  class Configuration
    attr_accessor :user_agent, :url, :version

    def initialize
      @url = 'https://app.rexpense.com'
      @version = 'v1'
      @user_agent = "Rexpense Ruby Client v#{Rexpense::VERSION}"
    end
  end
end
