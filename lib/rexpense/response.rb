require "rexpense/exception"

module Rexpense
  RequestTimeout = Class.new(Exception)
  RequestError   = Class.new(Exception)

  class Response < SimpleDelegator
    def resolve!
      if success?
        block_given? ? yield(self) : self
      elsif timed_out?
        timeout!
      else
        error!
      end
    end

    def parsed_body(key = nil)
      return MultiJson.load(body)[key] unless key.nil?
      MultiJson.load(body)
    rescue MultiJson::ParseError
      {}
    end

    private

    def timeout!
      raise RequestTimeout
    end

    def error!
      error = RequestError.new(
        code:    code,
        message: request_error_message,
        body:    parsed_body
      )
      raise error
    end

    def request_error_message
      return status_message if !status_message.nil? && status_message != ""
      parsed_body["error"] || ""
    end
  end
end
