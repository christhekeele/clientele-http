require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NotAcceptable < Concrete

        @code = 406
        @description = "Not Acceptable"

      end
    end
  end
end
