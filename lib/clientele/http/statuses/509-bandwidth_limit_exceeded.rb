require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class BandwidthLimitExceeded < Concrete

        @code = 509
        @description = "Bandwidth Limit Exceeded"

      end
    end
  end
end
