require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ProxyAuthenticate < Concrete

        @name = "Proxy-Authenticate"
        @type = :response

      end
    end
  end
end
