require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Trace < Concrete

        @method        = :TRACE
        @request_body  = false
        @response_body = true

      end
    end
  end
end
