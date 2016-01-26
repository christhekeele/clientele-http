require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Forwarded < Concrete

        @name = "Forwarded"
        @type = :request

      end
    end
  end
end
