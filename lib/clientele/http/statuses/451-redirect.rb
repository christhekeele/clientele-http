require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Redirect < Concrete

        @code = 451
        @description = "Redirect"

      end
    end
  end
end
