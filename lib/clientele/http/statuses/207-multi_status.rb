require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class MultiStatus < Concrete

        @code = 207
        @description = "Multi-Status"

      end
    end
  end
end
