require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class URITooLong < Concrete

        @code = 414
        @description = "URI Too Long"

      end
    end
  end
end
