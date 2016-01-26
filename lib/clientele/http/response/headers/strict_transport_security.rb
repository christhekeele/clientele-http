require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class StrictTransportSecurity < Concrete

        @name = "Strict-Transport-Security"
        @type = :response

      end
    end
  end
end
