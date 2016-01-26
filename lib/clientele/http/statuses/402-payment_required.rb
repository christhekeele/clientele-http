require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PaymentRequired < Concrete

        @code = 402
        @description = "Payment Required"

      end
    end
  end
end
