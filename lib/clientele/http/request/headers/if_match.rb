require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class IfMatch < Concrete

        @name = "If-Match"
        @type = :request

      end
    end
  end
end
