require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ConnectionTimedOut < Concrete

        @code = 522
        @description = "Connection Timed Out"

      end
    end
  end
end
