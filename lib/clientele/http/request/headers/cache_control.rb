require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class CacheControl < Concrete

        @name = "Cache-Control"
        @type = :request

      end
    end
  end
end
