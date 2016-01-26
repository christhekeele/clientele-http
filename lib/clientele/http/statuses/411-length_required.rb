require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class LengthRequired < Concrete

        @code = 411
        @description = "Length Required"

      end
    end
  end
end
