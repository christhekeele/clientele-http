require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class UnsupportedMediaType < Concrete

        @code = 415
        @description = "Unsupported Media Type"

      end
    end
  end
end
