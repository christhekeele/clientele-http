require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Link < Concrete

        @name = "Link"
        @type = :response

      end
    end
  end
end
