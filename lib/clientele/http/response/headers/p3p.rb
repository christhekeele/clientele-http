require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class P3p < Concrete

        @name = "P3P"
        @type = :response

      end
    end
  end
end
