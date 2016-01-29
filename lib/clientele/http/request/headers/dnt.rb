require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Dnt < Concrete

        @name = "DNT"
        @type = :request

      end
    end
  end
end
