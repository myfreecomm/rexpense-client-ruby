require "base64"

module Rexpense
  class Configuration
    attr_accessor :url, :user_agent

    def initialize
      @url = "https://app.rexpense.com"
      @user_agent = "Rexpense Ruby Client v#{Rexpense::VERSION}"
    end
  end
end
