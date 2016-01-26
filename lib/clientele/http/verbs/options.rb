require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Options < Concrete

        @method        = :OPTIONS
        @request_body  = true
        @response_body = true

      end
    end
  end
end
