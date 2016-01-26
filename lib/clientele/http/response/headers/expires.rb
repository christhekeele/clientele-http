require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Expires < Concrete

        @name = "Expires"
        @type = :response

      end
    end
  end
end
