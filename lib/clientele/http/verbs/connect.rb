require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Connect < Concrete

        @method        = :CONNECT
        @request_body  = true
        @response_body = true

      end
    end
  end
end
