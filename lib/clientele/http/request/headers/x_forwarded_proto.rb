require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XForwardedProto < Concrete

        @name = "X-Forwarded-Proto"
        @type = :request

      end
    end
  end
end
