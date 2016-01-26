require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class TooManyRequests < Concrete

        @code = 429
        @description = "Too Many Requests"

      end
    end
  end
end
