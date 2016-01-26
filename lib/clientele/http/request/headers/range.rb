require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Range < Concrete

        @name = "Range"
        @type = :request

      end
    end
  end
end
