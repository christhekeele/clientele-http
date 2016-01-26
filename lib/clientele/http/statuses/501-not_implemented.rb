require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NotImplemented < Concrete

        @code = 501
        @description = "Not Implemented"

      end
    end
  end
end
