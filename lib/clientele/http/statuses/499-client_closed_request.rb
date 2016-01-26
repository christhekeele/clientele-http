require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ClientClosedRequest < Concrete

        @code = 499
        @description = "Client Closed Request"

      end
    end
  end
end
