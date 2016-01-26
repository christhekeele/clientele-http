require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class SwitchingProtocols < Concrete

        @code = 101
        @description = "Switching Protocols"

      end
    end
  end
end
