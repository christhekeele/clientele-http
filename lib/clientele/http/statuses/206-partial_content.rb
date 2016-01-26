require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PartialContent < Concrete

        @code = 206
        @description = "Partial Content"

      end
    end
  end
end
