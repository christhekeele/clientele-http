require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class PublicKeyPins < Concrete

        @name = "Public-Key-Pins"
        @type = :response

      end
    end
  end
end
