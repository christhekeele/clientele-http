require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Forbidden < Concrete

        @code = 403
        @description = "Forbidden"

      end
    end
  end
end
