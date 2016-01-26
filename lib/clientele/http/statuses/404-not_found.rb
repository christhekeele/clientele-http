require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NotFound < Concrete

        @code = 404
        @description = "Not Found"

      end
    end
  end
end
