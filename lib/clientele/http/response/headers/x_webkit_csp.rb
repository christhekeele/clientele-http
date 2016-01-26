require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XWebKitCSP < Concrete

        @name = "X-WebKit-CSP"
        @type = :response

      end
    end
  end
end
