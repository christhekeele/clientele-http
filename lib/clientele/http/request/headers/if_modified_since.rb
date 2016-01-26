require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class IfModifiedSince < Concrete

        @name = "If-Modified-Since"
        @type = :request

      end
    end
  end
end
