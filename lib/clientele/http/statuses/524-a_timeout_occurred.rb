require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ATimeoutOccurred < Concrete

        @code = 524
        @description = "A Timeout Occurred"

      end
    end
  end
end
