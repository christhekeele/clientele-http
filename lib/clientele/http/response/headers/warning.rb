require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Warning < Concrete

        @name = "Warning"
        @type = :response

      end
    end
  end
end
