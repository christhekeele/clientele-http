require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XFrameOptions < Concrete

        @name = "X-Frame-Options"
        @type = :response

      end
    end
  end
end
