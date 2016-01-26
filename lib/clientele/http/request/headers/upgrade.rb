require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Upgrade < Concrete

        @name = "Upgrade"
        @type = :request

      end
    end
  end
end
