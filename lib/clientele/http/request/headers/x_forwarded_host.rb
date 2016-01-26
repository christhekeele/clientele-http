require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XForwardedHost < Concrete

        @name = "X-Forwarded-Host"
        @type = :request

      end
    end
  end
end
