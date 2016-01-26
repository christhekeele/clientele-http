require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XPoweredBy < Concrete

        @name = "X-Powered-By"
        @type = :response

      end
    end
  end
end
