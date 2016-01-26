require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class OriginIsUnreachable < Concrete

        @code = 523
        @description = "Origin Is Unreachable"

      end
    end
  end
end
