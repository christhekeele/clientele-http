require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Location < Concrete

        @name = "Location"
        @type = :response

      end
    end
  end
end
