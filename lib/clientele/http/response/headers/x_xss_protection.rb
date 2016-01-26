require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XXSSProtection < Concrete

        @name = "X-XSS-Protection"
        @type = :response

      end
    end
  end
end
