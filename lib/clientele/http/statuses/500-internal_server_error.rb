require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class InternalServerError < Concrete

        @code = 500
        @description = "Internal Server Error"

      end
    end
  end
end
