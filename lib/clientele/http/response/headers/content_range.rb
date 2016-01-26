require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentRange < Concrete

        @name = "Content-Range"
        @type = :response

      end
    end
  end
end
