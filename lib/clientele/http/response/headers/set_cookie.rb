require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class SetCookie < Concrete

        @name = "Set-Cookie"
        @type = :response

      end
    end
  end
end
