require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Patch < Concrete

        @method        = :PATCH
        @request_body  = true
        @response_body = true

      end
    end
  end
end
