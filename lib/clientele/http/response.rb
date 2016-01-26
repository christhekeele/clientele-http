require 'forwardable'

require 'clientele/http/statuses'
require 'clientele/http/response/headers'

module Clientele
  module HTTP
    class Response < Struct.new(:status, :headers, :body)

      def initialize(status, headers, body)
        super Status.for(status), Headers.new(headers), body
      end

    end
  end
end
