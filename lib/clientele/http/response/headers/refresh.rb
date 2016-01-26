require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Refresh < Concrete

        @name = "Refresh"
        @type = :response

      end
    end
  end
end
