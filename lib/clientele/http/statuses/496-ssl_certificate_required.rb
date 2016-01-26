require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class SSLCertificateRequired < Concrete

        @code = 496
        @description = "SSL Certificate Required"

      end
    end
  end
end
