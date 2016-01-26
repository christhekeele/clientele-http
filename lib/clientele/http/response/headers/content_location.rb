require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentLocation < Concrete

        @name = "Content-Location"
        @type = :response

      end
    end
  end
end
