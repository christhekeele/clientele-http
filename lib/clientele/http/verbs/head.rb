require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Head < Concrete

        @method        = :HEAD
        @request_body  = false
        @response_body = false

      end
    end
  end
end
