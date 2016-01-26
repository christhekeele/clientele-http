require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Host < Concrete

        @name = "Host"
        @type = :request

      end
    end
  end
end
