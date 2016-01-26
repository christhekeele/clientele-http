require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XRequestedWith < Concrete

        @name = "X-Requested-With"
        @type = :request

      end
    end
  end
end
