require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class FrontEndHttps < Concrete

        @name = "Front-End-Https"
        @type = :request

      end
    end
  end
end
