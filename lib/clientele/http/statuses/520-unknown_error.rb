require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class UnknownError < Concrete

        @code = 520
        @description = "Unknown Error"

      end
    end
  end
end
