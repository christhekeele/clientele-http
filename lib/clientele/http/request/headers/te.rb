require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Te < Concrete

        @name = "TE"
        @type = :request

      end
    end
  end
end
