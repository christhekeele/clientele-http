require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class UseProxy < Concrete

        @code = 305
        @description = "Use Proxy"

      end
    end
  end
end
