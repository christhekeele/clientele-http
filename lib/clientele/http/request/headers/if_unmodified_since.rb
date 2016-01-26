require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class IfUnmodifiedSince < Concrete

        @name = "If-Unmodified-Since"
        @type = :request

      end
    end
  end
end
