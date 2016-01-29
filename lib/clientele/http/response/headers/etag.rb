require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Etag < Concrete

        @name = "ETag"
        @type = :response

      end
    end
  end
end
