require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentType < Concrete

        @name = "Content-Type"
        @type = :response

      end
    end
  end
end
