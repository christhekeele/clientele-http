require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XUIDH < Concrete

        @name = "X-UIDH"
        @type = :request

      end
    end
  end
end
