require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Delete < Concrete

        @method        = :DELETE
        @request_body  = false
        @response_body = true

      end
    end
  end
end
