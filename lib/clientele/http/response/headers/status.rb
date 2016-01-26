require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Status < Concrete

        @name = "Status"
        @type = :response

      end
    end
  end
end
