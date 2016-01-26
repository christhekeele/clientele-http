require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentLength < Concrete

        @name = "Content-Length"
        @type = :response

      end
    end
  end
end
