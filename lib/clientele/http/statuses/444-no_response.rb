require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NoResponse < Concrete

        @code = 444
        @description = "No Response"

      end
    end
  end
end
