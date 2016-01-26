require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class AlreadyReported < Concrete

        @code = 208
        @description = "Already Reported"

      end
    end
  end
end
