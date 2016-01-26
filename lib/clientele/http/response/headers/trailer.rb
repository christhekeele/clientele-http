require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Trailer < Concrete

        @name = "Trailer"
        @type = :response

      end
    end
  end
end
