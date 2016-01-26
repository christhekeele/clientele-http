require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PreconditionFailed < Concrete

        @code = 412
        @description = "Precondition Failed"

      end
    end
  end
end
