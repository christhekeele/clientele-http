require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XCsrfToken < Concrete

        @name = "X-Csrf-Token"
        @type = :request

      end
    end
  end
end
