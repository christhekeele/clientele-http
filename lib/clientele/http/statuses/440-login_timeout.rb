require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class LoginTimeout < Concrete

        @code = 440
        @description = "Login Timeout"

      end
    end
  end
end
