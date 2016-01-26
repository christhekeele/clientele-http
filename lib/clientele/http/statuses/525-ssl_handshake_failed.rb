require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class SSLHandshakeFailed < Concrete

        @code = 525
        @description = "SSL Handshake Failed"

      end
    end
  end
end
