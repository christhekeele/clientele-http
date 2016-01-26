require "clientele/http/verb"

module Clientele
  module HTTP
    class Verb
      class Post < Concrete

        @method        = :POST
        @request_body  = true
        @response_body = true

      end
    end
  end
end
