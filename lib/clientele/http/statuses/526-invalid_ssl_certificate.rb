require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class InvalidSSLCertificate < Concrete

        @code = 526
        @description = "Invalid SSL Certificate"

      end
    end
  end
end
