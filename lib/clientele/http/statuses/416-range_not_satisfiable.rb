require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class RangeNotSatisfiable < Concrete

        @code = 416
        @description = "Range Not Satisfiable"

      end
    end
  end
end
