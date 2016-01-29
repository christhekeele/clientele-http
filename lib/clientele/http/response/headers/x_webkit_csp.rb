require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XWebkitCsp < Concrete

        @name = "X-WebKit-CSP"
        @type = :response

      end
    end
  end
end
