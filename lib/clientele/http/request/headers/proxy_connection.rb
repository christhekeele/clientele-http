require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ProxyConnection < Concrete

        @name = "Proxy-Connection"
        @type = :request

      end
    end
  end
end
