require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Server < Concrete

        @name = "Server"
        @type = :response

      end
    end
  end
end
