require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Options < Concrete

        @method        = :OPTIONS
        @request_body  = false
        @response_body = false

      end
    end
  end
end
