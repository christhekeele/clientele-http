require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class UpgradeRequired < Concrete

        @code = 426
        @description = "Upgrade Required"

      end
    end
  end
end
