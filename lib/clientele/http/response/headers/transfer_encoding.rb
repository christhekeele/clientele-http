require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class TransferEncoding < Concrete

        @name = "Transfer-Encoding"
        @type = :response

      end
    end
  end
end
