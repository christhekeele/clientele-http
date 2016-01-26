require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentLength < Concrete

        @name = "Content-Length"
        @type = :request

      end
    end
  end
end
