require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class NonAuthoritativeInformation < Concrete

        @code = 203
        @description = "Non-Authoritative Information"

      end
    end
  end
end
