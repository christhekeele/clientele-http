require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ResetContent < Concrete

        @code = 205
        @description = "Reset Content"

      end
    end
  end
end
