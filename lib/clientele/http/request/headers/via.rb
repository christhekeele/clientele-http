require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Via < Concrete

        @name = "Via"
        @type = :request

      end
    end
  end
end
