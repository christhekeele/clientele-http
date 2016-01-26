require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ExpectationFailed < Concrete

        @code = 417
        @description = "Expectation Failed"

      end
    end
  end
end
