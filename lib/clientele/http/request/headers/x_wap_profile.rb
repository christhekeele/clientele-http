require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XWapProfile < Concrete

        @name = "X-Wap-Profile"
        @type = :request

      end
    end
  end
end
