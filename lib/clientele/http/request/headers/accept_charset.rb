require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptCharset < Concrete

        @name = "Accept-Charset"
        @type = :request

      end
    end
  end
end
