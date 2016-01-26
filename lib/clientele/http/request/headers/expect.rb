require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Expect < Concrete

        @name = "Expect"
        @type = :request

      end
    end
  end
end
