require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NetworkAuthenticationRequired < Concrete

        @code = 511
        @description = "Network Authentication Required"

      end
    end
  end
end
