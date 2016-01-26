require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentEncoding < Concrete

        @name = "Content-Encoding"
        @type = :response

      end
    end
  end
end
