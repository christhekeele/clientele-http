require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Continue < Concrete

        @code = 100
        @description = "Continue"

      end
    end
  end
end
