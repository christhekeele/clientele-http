require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Get < Concrete

        @method        = :GET
        @request_body  = false
        @response_body = true

      end
    end
  end
end
