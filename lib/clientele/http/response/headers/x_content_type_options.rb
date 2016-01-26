require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XContentTypeOptions < Concrete

        @name = "X-Content-Type-Options"
        @type = :response

      end
    end
  end
end
