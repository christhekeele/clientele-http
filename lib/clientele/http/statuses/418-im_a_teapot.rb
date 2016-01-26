require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class ImATeapot < Concrete

        @code = 418
        @description = "I'm a teapot"

      end
    end
  end
end
