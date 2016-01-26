require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Accept < Concrete

        @name = "Accept"
        @type = :request

      end
    end
  end
end
