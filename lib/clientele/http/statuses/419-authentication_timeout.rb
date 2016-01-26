require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class AuthenticationTimeout < Concrete

        @code = 419
        @description = "Authentication Timeout"

      end
    end
  end
end
