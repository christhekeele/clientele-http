require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class RequestHeaderFieldsTooLarge < Concrete

        @code = 431
        @description = "Request Header Fields Too Large"

      end
    end
  end
end
