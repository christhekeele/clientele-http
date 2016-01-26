require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class BadGateway < Concrete

        @code = 502
        @description = "Bad Gateway"

      end
    end
  end
end
