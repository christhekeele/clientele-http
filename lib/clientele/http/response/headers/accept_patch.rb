require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptPatch < Concrete

        @name = "Accept-Patch"
        @type = :response

      end
    end
  end
end
