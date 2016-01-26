require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Locked < Concrete

        @code = 423
        @description = "Locked"

      end
    end
  end
end
