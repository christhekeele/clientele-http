require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptRanges < Concrete

        @name = "Accept-Ranges"
        @type = :response

      end
    end
  end
end
