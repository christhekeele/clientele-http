require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Via < Concrete

        @name = "Via"
        @type = :response

      end
    end
  end
end
