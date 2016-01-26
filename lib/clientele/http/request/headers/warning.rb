require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Warning < Concrete

        @name = "Warning"
        @type = :request

      end
    end
  end
end
