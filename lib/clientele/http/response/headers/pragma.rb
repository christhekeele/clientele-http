require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Pragma < Concrete

        @name = "Pragma"
        @type = :response

      end
    end
  end
end
