require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ProxyAuthorization < Concrete

        @name = "Proxy-Authorization"
        @type = :request

      end
    end
  end
end
