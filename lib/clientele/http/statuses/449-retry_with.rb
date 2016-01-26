require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class RetryWith < Concrete

        @code = 449
        @description = "Retry With"

      end
    end
  end
end
