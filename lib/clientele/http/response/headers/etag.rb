require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ETag < Concrete

        @name = "ETag"
        @type = :response

      end
    end
  end
end
