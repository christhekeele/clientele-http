require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XContentDuration < Concrete

        @name = "X-Content-Duration"
        @type = :response

      end
    end
  end
end
