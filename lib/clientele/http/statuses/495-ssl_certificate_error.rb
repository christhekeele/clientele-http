require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class SSLCertificateError < Concrete

        @code = 495
        @description = "SSL Certificate Error"

      end
    end
  end
end
