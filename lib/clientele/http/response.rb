require 'forwardable'

require 'clientele/http/utils'

module Clientele
  module HTTP
    RESPONSE = Struct.new(:status, :headers, :body)
    class Response < RESPONSE

      include Utils::DeepStructCopy
      include Utils::DeepStructFreeze

      def initialize(status, headers, body)
        super(
          status_for(status),
          headers_for(headers),
          body_for(body),
        )
      end

      def status= status
        super status_for status
      end

      def update_status(status)
        clone.tap do |response|
          response.status = status
        end
      end

      def headers= headers
        super headers_for headers
      end

      def update_headers(headers)
        clone.tap do |response|
          response.headers = headers
        end
      end

      def body= body
        super body_for body
      end

      def update_body(body)
        clone.tap do |response|
          response.body = body
        end
      end

    private

      def status_for(status)
        Status.for status
      end

      def headers_for(headers)
        Headers.new headers
      end

      def body_for(body)
        Body.new body
      end

    end
  end
end

require 'clientele/http/statuses'
require 'clientele/http/headers'
require 'clientele/http/response/body'
require 'clientele/http/response/headers'
