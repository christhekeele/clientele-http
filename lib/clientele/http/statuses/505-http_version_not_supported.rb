require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class HTTPVersionNotSupported < Concrete

        @code = 505
        @description = "HTTP Version Not Supported"

      end
    end
  end
end
