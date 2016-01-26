require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class GatewayTimeout < Concrete

        @code = 504
        @description = "Gateway Timeout"

      end
    end
  end
end
