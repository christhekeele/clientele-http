require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class InsufficientStorage < Concrete

        @code = 507
        @description = "Insufficient Storage"

      end
    end
  end
end
