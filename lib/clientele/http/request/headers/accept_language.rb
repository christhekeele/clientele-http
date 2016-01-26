require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptLanguage < Concrete

        @name = "Accept-Language"
        @type = :request

      end
    end
  end
end
