require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentSecurityPolicy < Concrete

        @name = "Content-Security-Policy"
        @type = :response

      end
    end
  end
end
