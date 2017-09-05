require "rexpense/exception"

module Rexpense
  class RequestTimeout < Exception; end
  class RequestError < Exception; end

  class Response < SimpleDelegator
    def resolve!
      if success?
        block_given? ? yield(self) : self
      elsif timed_out?
        raise RequestTimeout
      else
        error!
      end
    end

    def parsed_body(key = nil)
      return JSON.parse(body)[key] unless key.nil?
      JSON.parse(body)
    rescue JSON::ParserError
      {}
    end

    private

    def error!
      raise RequestError.new(
        code:    code,
        message: request_error_message,
        body:    parsed_body
      )
    end

    def request_error_message
      if !status_message.nil? && status_message != ""
        status_message
      else
        parsed_body["error"] || ""
      end
    end
  end
end
