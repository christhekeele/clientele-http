require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class OK < Concrete

        @code = 200
        @description = "OK"

      end
    end
  end
end
