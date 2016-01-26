require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NotExtended < Concrete

        @code = 510
        @description = "Not Extended"

      end
    end
  end
end
