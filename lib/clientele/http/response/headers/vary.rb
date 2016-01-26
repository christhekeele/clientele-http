require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Vary < Concrete

        @name = "Vary"
        @type = :response

      end
    end
  end
end
