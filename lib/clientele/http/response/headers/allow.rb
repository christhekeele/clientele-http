require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Allow < Concrete

        @name = "Allow"
        @type = :response

      end
    end
  end
end
