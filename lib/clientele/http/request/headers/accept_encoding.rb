require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptEncoding < Concrete

        @name = "Accept-Encoding"
        @type = :request

      end
    end
  end
end
