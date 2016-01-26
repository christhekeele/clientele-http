require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XUACompatible < Concrete

        @name = "X-UA-Compatible"
        @type = :response

      end
    end
  end
end
