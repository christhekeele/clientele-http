require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class P3P < Concrete

        @name = "P3P"
        @type = :response

      end
    end
  end
end
