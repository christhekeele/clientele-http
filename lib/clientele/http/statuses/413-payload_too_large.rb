require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PayloadTooLarge < Concrete

        @code = 413
        @description = "Payload Too Large"

      end
    end
  end
end
