require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class RequestTimeout < Concrete

        @code = 408
        @description = "Request Timeout"

      end
    end
  end
end
