require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class UserAgent < Concrete

        @name = "User-Agent"
        @type = :request

      end
    end
  end
end
