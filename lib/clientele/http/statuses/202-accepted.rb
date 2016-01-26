require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Accepted < Concrete

        @code = 202
        @description = "Accepted"

      end
    end
  end
end
