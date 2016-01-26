require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Age < Concrete

        @name = "Age"
        @type = :response

      end
    end
  end
end
