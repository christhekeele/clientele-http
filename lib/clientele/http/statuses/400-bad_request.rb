require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class BadRequest < Concrete

        @code = 400
        @description = "Bad Request"

      end
    end
  end
end
