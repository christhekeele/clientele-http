require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class WebServerIsDown < Concrete

        @code = 521
        @description = "Web Server Is Down"

      end
    end
  end
end
