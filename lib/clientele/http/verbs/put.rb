require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Put < Concrete

        @method        = :PUT
        @request_body  = true
        @response_body = true

      end
    end
  end
end
