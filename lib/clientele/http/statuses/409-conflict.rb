require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Conflict < Concrete

        @code = 409
        @description = "Conflict"

      end
    end
  end
end
