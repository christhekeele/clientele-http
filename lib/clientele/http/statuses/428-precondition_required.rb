require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PreconditionRequired < Concrete

        @code = 428
        @description = "Precondition Required"

      end
    end
  end
end
