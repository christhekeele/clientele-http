require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class WWWAuthenticate < Concrete

        @name = "WWW-Authenticate"
        @type = :response

      end
    end
  end
end
