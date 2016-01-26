require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class MovedPermanently < Concrete

        @code = 301
        @description = "Moved Permanently"

      end
    end
  end
end
