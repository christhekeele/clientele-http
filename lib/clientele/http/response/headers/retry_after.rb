require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class RetryAfter < Concrete

        @name = "Retry-After"
        @type = :response

      end
    end
  end
end
