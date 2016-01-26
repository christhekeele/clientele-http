require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class MaxForwards < Concrete

        @name = "Max-Forwards"
        @type = :request

      end
    end
  end
end
