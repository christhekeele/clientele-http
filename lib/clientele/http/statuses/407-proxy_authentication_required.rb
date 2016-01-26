require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ProxyAuthenticationRequired < Concrete

        @code = 407
        @description = "Proxy Authentication Required"

      end
    end
  end
end
