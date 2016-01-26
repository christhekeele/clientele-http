require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Origin < Concrete

        @name = "Origin"
        @type = :request

      end
    end
  end
end
