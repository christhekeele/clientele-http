require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentDisposition < Concrete

        @name = "Content-Disposition"
        @type = :response

      end
    end
  end
end
