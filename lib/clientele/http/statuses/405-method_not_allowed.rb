require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class MethodNotAllowed < Concrete

        @code = 405
        @description = "Method Not Allowed"

      end
    end
  end
end
