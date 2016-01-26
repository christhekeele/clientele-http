require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class DNT < Concrete

        @name = "DNT"
        @type = :request

      end
    end
  end
end
