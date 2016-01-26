require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class From < Concrete

        @name = "From"
        @type = :request

      end
    end
  end
end
