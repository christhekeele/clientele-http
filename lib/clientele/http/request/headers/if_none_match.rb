require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class IfNoneMatch < Concrete

        @name = "If-None-Match"
        @type = :request

      end
    end
  end
end
