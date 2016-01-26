require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Connection < Concrete

        @name = "Connection"
        @type = :request

      end
    end
  end
end
