require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class BlockedByWindowsParentalControls < Concrete

        @code = 450
        @description = "Blocked by Windows Parental Controls"

      end
    end
  end
end
