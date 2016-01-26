require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Referer < Concrete

        @name = "Referer"
        @type = :request

      end
    end
  end
end
