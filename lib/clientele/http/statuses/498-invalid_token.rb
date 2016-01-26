require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class InvalidToken < Concrete

        @code = 498
        @description = "Invalid Token"

      end
    end
  end
end
