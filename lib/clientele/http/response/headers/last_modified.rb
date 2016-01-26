require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class LastModified < Concrete

        @name = "Last-Modified"
        @type = :response

      end
    end
  end
end
