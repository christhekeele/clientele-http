require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class IfRange < Concrete

        @name = "If-Range"
        @type = :request

      end
    end
  end
end
