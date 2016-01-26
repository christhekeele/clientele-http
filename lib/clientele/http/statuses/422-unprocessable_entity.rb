require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class UnprocessableEntity < Concrete

        @code = 422
        @description = "Unprocessable Entity"

      end
    end
  end
end
