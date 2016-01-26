require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class MisdirectedRequest < Concrete

        @code = 421
        @description = "Misdirected Request"

      end
    end
  end
end
