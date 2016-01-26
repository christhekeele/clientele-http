require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ServiceUnavailable < Concrete

        @code = 503
        @description = "Service Unavailable"

      end
    end
  end
end
