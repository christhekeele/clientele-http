require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XContentSecurityPolicy < Concrete

        @name = "X-Content-Security-Policy"
        @type = :response

      end
    end
  end
end
