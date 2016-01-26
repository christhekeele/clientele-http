require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Unauthorized < Concrete

        @code = 401
        @description = "Unauthorized"

      end
    end
  end
end
