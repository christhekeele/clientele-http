require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NotModified < Concrete

        @code = 304
        @description = "Not Modified"

      end
    end
  end
end
