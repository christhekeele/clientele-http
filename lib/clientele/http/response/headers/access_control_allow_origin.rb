require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AccessControlAllowOrigin < Concrete

        @name = "Access-Control-Allow-Origin"
        @type = :response

      end
    end
  end
end
