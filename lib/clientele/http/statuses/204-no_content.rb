require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NoContent < Concrete

        @code = 204
        @description = "No Content"

      end
    end
  end
end
