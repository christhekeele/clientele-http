require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Delete < Concrete

        @method        = :DELETE
        @request_body  = true
        @response_body = true

      end
    end
  end
end
