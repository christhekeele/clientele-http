require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Authorization < Concrete

        @name = "Authorization"
        @type = :request

      end
    end
  end
end
