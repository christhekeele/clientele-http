require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Cookie < Concrete

        @name = "Cookie"
        @type = :request

      end
    end
  end
end
