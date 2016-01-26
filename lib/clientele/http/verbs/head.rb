require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Head < Concrete

        @method        = :HEAD
        @request_body  = true
        @response_body = true

      end
    end
  end
end
