require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Date < Concrete

        @name = "Date"
        @type = :response

      end
    end
  end
end
