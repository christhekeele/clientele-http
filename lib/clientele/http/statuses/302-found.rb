require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Found < Concrete

        @code = 302
        @description = "Found"

      end
    end
  end
end
