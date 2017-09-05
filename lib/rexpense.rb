require "typhoeus"
require "mime/types"
require "require_all"

require_rel "rexpense"

module Rexpense
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.client(token)
    Client.new(token)
  end
end
