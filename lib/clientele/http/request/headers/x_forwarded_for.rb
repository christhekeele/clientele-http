require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XForwardedFor < Concrete

        @name = "X-Forwarded-For"
        @type = :request

      end
    end
  end
end
