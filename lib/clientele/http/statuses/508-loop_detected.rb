require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class LoopDetected < Concrete

        @code = 508
        @description = "Loop Detected"

      end
    end
  end
end
