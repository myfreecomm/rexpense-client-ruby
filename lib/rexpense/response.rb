require "rexpense/exception"

module Rexpense
  class RequestTimeout < RuntimeError; end
  class RequestError < RuntimeError; end

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
      return body_json[key] unless key.nil?
      body_json
    rescue MultiJson::ParseError
      {}
    end

    private

    def error!
      error = RequestError.new(
        code:    code,
        message: request_error_message,
        body:    parsed_body
      )
      raise error
    end

    def request_error_message
      if !status_message.nil? && status_message != ""
        status_message
      else
        parsed_body["error"] || ""
      end
    end

    def body_json
      MultiJson.load(body)
    end
  end
end
